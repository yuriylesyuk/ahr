ahr Apigee Hybrid Runtime utility

Status: v0.7 alpha. Current theme: UX fine-tuning. Things are stabilizing but expect a few refectorings until beta.

# Things to look for if you're interested to contribute

* Output of some commands is too noisy/verbose during 'happy path' run; we need to fine-tune it

* Functionally complete: commands need to cover whole sdlc experience of a specific component. look at the ahr-sa-ctl for an example of what we aim to

* Mininal but useful comments in source code



# Use Cases

Does this world really need another abstraction laver over apigeectl/.yaml config files?!

Apparently, yes.

* The automation. Create a single-command CD/CD for Performance Test that would a) install Runtime; b) deploy proxies; c) execute tests d) collect outputs e) destroy test environment

* Study tool. 


# Design Principles

* Executable documentation

  The scripts are meant to be read and consulted to observe how to implement required steps. You will need them for your authomation (ie, CI/CD scripts)

* Be intuitively compatible with a manual installation process

  The collection of ahr-* scripts and their options are tasks that are the high-level process of Hybrid installation process.

* Templating

  For cluster config and runtime config file we cannot provide generic enough file to cater for all eventualities. Therefore we provide a templating mechanism that lets you create any desired configuration.

# Scripting Best Practices

* Full explicit paths -- removes a current-directory ambiguity

* Copy-Paste-friendly commands -- via usage of environment variables










# Please, go to ahr wiki, https://github.com/yuriylesyuk/ahr/wiki, for documentation.


<hr>

## Disclaimer

This repository and its contents are not an official Google product, nor are they part of an official Google product.


## License

This material is copyright 2020, Google LLC.
and is licensed under the Apache 2.0 license. See the [LICENSE](LICENSE) file.


## Contributing

See the [contributing instructions](/CONTRIBUTING.md) to get started.

## Status

This is a community supported project. There is no warranty for this code.
If you have problems or questions, ask on [commmunity.apigee.com](https://community.apigee.com)..


