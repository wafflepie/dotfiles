#!/usr/bin/node

// Run `sudo usermod -a -G input $USER` and restart your system before running this.
const { createReadStream } = require("fs");
const { fromEvent } = require("rxjs");
const { merge, mapTo, distinctUntilChanged } = require("rxjs/operators");
const { exec } = require("child_process");

const readStreamAsObservable = (path) =>
  fromEvent(createReadStream(path), "data");

const keyboardEvent$ = readStreamAsObservable("/dev/input/event3");
const touchpadEvent$ = readStreamAsObservable("/dev/input/event9");

const penEvent$ = readStreamAsObservable("/dev/input/event4");
const fingerEvent$ = readStreamAsObservable("/dev/input/event5");

const touchingTrue$ = penEvent$.pipe(merge(fingerEvent$), mapTo(true));
const touchingFalse$ = keyboardEvent$.pipe(merge(touchpadEvent$), mapTo(false));

const touching$ = touchingTrue$.pipe(merge(touchingFalse$));
const distinctTouching$ = touching$.pipe(distinctUntilChanged());

// TODO: Figure out why this crap doesn't work when not run manually.
distinctTouching$.subscribe((touching) =>
  exec(
    `gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled ${touching}`
  )
);
