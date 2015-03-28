# Zeus

Zeus is a distributed personal assistant. It can play music, read your mail, answer your questions and much more. Check out the [website](http://xiproject.github.io/zeus).

Zeus consists of a [Core](https://github.com/xiproject/xi-core), and several agents, each of which can run on a separate node on a distributed system. These agents provide various kinds of functionality, and also plan and coordinate amongst themselves.

Zeus is built using the [Xi framework](http://xiproject.github.io).

## Prerequisites

You need at least:

- node v0.10.
- A reasonably fast internet connection.
- [bunyan](https://github.com/trentm/node-bunyan) to pretty print logs.

In addition, many agents have their own prerequisites. See the [full documentation](http://xi-zeus.readthedocs.org) for all agents in Zeus.

## Install and run

```sh
$ git clone https://github.com/xiproject/zeus && cd zeus
$ ./scripts/update.sh
$ ./scripts/run.sh 2>&1 | bunyan
```

### Set up speech to text

Install the [Chrome app]. Make sure to read the [caveats](https://github.com/xiproject/chrome-stt#caveats).

### Command line interface

Once Zeus is running, in a separate shell, run:

```sh
$ ./scripts/cli.sh
```

## Caveats

- Zeus is rough around the edges. It has no security. Don't run it on an untrusted network.
- Many agents use Google services all the time (speech-to-text, gmail) or provide an option to do so (text-to-speech). Please see the [full documentation](http://xi-zeus.readthedocs.org) to read the caveats associated with every agent.

## Contributions

Zeus and the Xi framework are in active development. Bug reports are welcome. Contributions are even more welcome - join the [mailing list](https://groups.google.com/forum/#!forum/xiproject-dev).

## License

GPLv3

[Chrome app]: https://chrome.google.com/webstore/detail/xi/pdifndlbcogjdkhobdinhfnclkanelbo
