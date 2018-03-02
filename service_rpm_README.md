{{name}}
=====

{{desc}}

Prepare
-------
    $ ./bootstrap

Build
-----

    $ rebar3 compile
or
    $ make

Build an RPM
------------

    $ rebar3 as prod build_rpm
or
    $ make package

    rpm will be located in _build/prod/rpm/
