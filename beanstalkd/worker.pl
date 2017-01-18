#!/usr/bin/perl
use Beanstalk::Client;

my $client = Beanstalk::Client->new(
  { server	 => "localhost:11301",
    default_tube => 'testTube',
  }
);

my $job = $client->reserve;
print $job;
