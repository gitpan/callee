use inc::Module::Install;
include 'Module::AutoInstall';

name 'callee';
all_from 'lib/callee.pm';
perl_version '5.006';

requires 'Devel::Caller';

test_requires 'Test::More' => '0.70';
extra_tests;

auto_install;
auto_include;
WriteAll;
