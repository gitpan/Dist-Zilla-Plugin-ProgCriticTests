
use strict;
use warnings;

BEGIN { require 5.008; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Gradually enforce coding standards with Dist::Zilla',
  'AUTHOR' => 'Christian Walde <mithaldu@yahoo.de>',
  'BUILD_REQUIRES' => {
    'Capture::Tiny' => '0',
    'Dist::Zilla::Tester' => '0',
    'JSON' => '2',
    'Params::Util' => '0',
    'Path::Class' => '0',
    'Sub::Exporter' => '0',
    'Test::More' => '0.88',
    'Test::Perl::Critic::Progressive' => '0',
    'Try::Tiny' => '0',
    'YAML::Tiny' => '0',
    'autodie' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Dist-Zilla-Plugin-ProgCriticTests',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Dist::Zilla::Plugin::ProgCriticTests',
  'PREREQ_PM' => {
    'Dist::Zilla::Plugin::InlineFiles' => '0',
    'Dist::Zilla::Role::TextTemplate' => '0',
    'Moose' => '0'
  },
  'VERSION' => '1.111730',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



