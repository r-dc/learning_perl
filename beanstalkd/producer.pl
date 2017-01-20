#!/usr/bin/perl
use Beanstalk::Client;

my $client = Beanstalk::Client->new(
  { server	 => "localhost",
    default_tube => "testTube",
  }
);

for (1..5) {
  my $job = $client->put(
    { data	=> rand(0xffff),
      priority	=> rand(100),
      ttr	=> rand(120),
      delay	=> rand(5),
    }
  );
}

my $job = $client->reserve;
print $job;
my $in = <STDIN>;
