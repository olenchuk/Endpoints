use Test::More qw(no_plan);
use Date::Calc::Endpoints;
use strict;
use warnings;


my $ref_date = '2016-08-15';

my $dr = Date::Calc::Endpoints->new(today_date => $ref_date);
my $type = 'MONTH';

while (my $line = <main::DATA>) {
    chomp $line;
    my ($start_day,$intervals,$span,$sliding_window,$direction,$test_start,$test_end,$test_last) = split /,/, $line;
    $dr->set_type($type);
    $dr->set_start_day_of_month($start_day);
    $dr->set_intervals($intervals);
    $dr->set_span($span);
    $dr->set_sliding_window($sliding_window);
    $dr->set_direction($direction);

    my $m = $dr->get_start_month_of_year;

    my $atts = "M=$m | I=$intervals | S=$span | W=$sliding_window | D=$direction";


    my ($start,$end,$last) = $dr->get_dates;
    cmp_ok($start,'eq',$test_start,"$type START $atts")
        or BAIL_OUT("Fail")
    ;
    cmp_ok($end,'eq',$test_end,"$type END $atts")
        or BAIL_OUT("Fail")
    ;
    cmp_ok($last,'eq',$test_last,"$type LAST $atts")
        or BAIL_OUT("Fail")
    ;

}

__END__
8,-3,1,0,-,2016-11-08,2016-12-08,2016-12-07
8,-2,1,0,-,2016-10-08,2016-11-08,2016-11-07
8,-1,1,0,-,2016-09-08,2016-10-08,2016-10-07
8,0,1,0,-,2016-08-08,2016-09-08,2016-09-07
8,1,1,0,-,2016-07-08,2016-08-08,2016-08-07
8,2,1,0,-,2016-06-08,2016-07-08,2016-07-07
8,3,1,0,-,2016-05-08,2016-06-08,2016-06-07
8,-3,5,0,-,2017-11-08,2018-04-08,2018-04-07
8,-2,5,0,-,2017-06-08,2017-11-08,2017-11-07
8,-1,5,0,-,2017-01-08,2017-06-08,2017-06-07
8,0,5,0,-,2016-08-08,2017-01-08,2017-01-07
8,1,5,0,-,2016-03-08,2016-08-08,2016-08-07
8,2,5,0,-,2015-10-08,2016-03-08,2016-03-07
8,3,5,0,-,2015-05-08,2015-10-08,2015-10-07
8,-3,5,1,-,2016-07-08,2016-12-08,2016-12-07
8,-2,5,1,-,2016-06-08,2016-11-08,2016-11-07
8,-1,5,1,-,2016-05-08,2016-10-08,2016-10-07
8,0,5,1,-,2016-04-08,2016-09-08,2016-09-07
8,1,5,1,-,2016-03-08,2016-08-08,2016-08-07
8,2,5,1,-,2016-02-08,2016-07-08,2016-07-07
8,3,5,1,-,2016-01-08,2016-06-08,2016-06-07
8,-3,1,0,+,2016-05-08,2016-06-08,2016-06-07
8,-2,1,0,+,2016-06-08,2016-07-08,2016-07-07
8,-1,1,0,+,2016-07-08,2016-08-08,2016-08-07
8,0,1,0,+,2016-08-08,2016-09-08,2016-09-07
8,1,1,0,+,2016-09-08,2016-10-08,2016-10-07
8,2,1,0,+,2016-10-08,2016-11-08,2016-11-07
8,3,1,0,+,2016-11-08,2016-12-08,2016-12-07
8,-3,5,0,+,2015-05-08,2015-10-08,2015-10-07
8,-2,5,0,+,2015-10-08,2016-03-08,2016-03-07
8,-1,5,0,+,2016-03-08,2016-08-08,2016-08-07
8,0,5,0,+,2016-08-08,2017-01-08,2017-01-07
8,1,5,0,+,2017-01-08,2017-06-08,2017-06-07
8,2,5,0,+,2017-06-08,2017-11-08,2017-11-07
8,3,5,0,+,2017-11-08,2018-04-08,2018-04-07
8,-3,5,1,+,2016-05-08,2016-10-08,2016-10-07
8,-2,5,1,+,2016-06-08,2016-11-08,2016-11-07
8,-1,5,1,+,2016-07-08,2016-12-08,2016-12-07
8,0,5,1,+,2016-08-08,2017-01-08,2017-01-07
8,1,5,1,+,2016-09-08,2017-02-08,2017-02-07
8,2,5,1,+,2016-10-08,2017-03-08,2017-03-07
8,3,5,1,+,2016-11-08,2017-04-08,2017-04-07
15,-3,1,0,-,2016-11-15,2016-12-15,2016-12-14
15,-2,1,0,-,2016-10-15,2016-11-15,2016-11-14
15,-1,1,0,-,2016-09-15,2016-10-15,2016-10-14
15,0,1,0,-,2016-08-15,2016-09-15,2016-09-14
15,1,1,0,-,2016-07-15,2016-08-15,2016-08-14
15,2,1,0,-,2016-06-15,2016-07-15,2016-07-14
15,3,1,0,-,2016-05-15,2016-06-15,2016-06-14
15,-3,5,0,-,2017-11-15,2018-04-15,2018-04-14
15,-2,5,0,-,2017-06-15,2017-11-15,2017-11-14
15,-1,5,0,-,2017-01-15,2017-06-15,2017-06-14
15,0,5,0,-,2016-08-15,2017-01-15,2017-01-14
15,1,5,0,-,2016-03-15,2016-08-15,2016-08-14
15,2,5,0,-,2015-10-15,2016-03-15,2016-03-14
15,3,5,0,-,2015-05-15,2015-10-15,2015-10-14
15,-3,5,1,-,2016-07-15,2016-12-15,2016-12-14
15,-2,5,1,-,2016-06-15,2016-11-15,2016-11-14
15,-1,5,1,-,2016-05-15,2016-10-15,2016-10-14
15,0,5,1,-,2016-04-15,2016-09-15,2016-09-14
15,1,5,1,-,2016-03-15,2016-08-15,2016-08-14
15,2,5,1,-,2016-02-15,2016-07-15,2016-07-14
15,3,5,1,-,2016-01-15,2016-06-15,2016-06-14
15,-3,1,0,+,2016-05-15,2016-06-15,2016-06-14
15,-2,1,0,+,2016-06-15,2016-07-15,2016-07-14
15,-1,1,0,+,2016-07-15,2016-08-15,2016-08-14
15,0,1,0,+,2016-08-15,2016-09-15,2016-09-14
15,1,1,0,+,2016-09-15,2016-10-15,2016-10-14
15,2,1,0,+,2016-10-15,2016-11-15,2016-11-14
15,3,1,0,+,2016-11-15,2016-12-15,2016-12-14
15,-3,5,0,+,2015-05-15,2015-10-15,2015-10-14
15,-2,5,0,+,2015-10-15,2016-03-15,2016-03-14
15,-1,5,0,+,2016-03-15,2016-08-15,2016-08-14
15,0,5,0,+,2016-08-15,2017-01-15,2017-01-14
15,1,5,0,+,2017-01-15,2017-06-15,2017-06-14
15,2,5,0,+,2017-06-15,2017-11-15,2017-11-14
15,3,5,0,+,2017-11-15,2018-04-15,2018-04-14
15,-3,5,1,+,2016-05-15,2016-10-15,2016-10-14
15,-2,5,1,+,2016-06-15,2016-11-15,2016-11-14
15,-1,5,1,+,2016-07-15,2016-12-15,2016-12-14
15,0,5,1,+,2016-08-15,2017-01-15,2017-01-14
15,1,5,1,+,2016-09-15,2017-02-15,2017-02-14
15,2,5,1,+,2016-10-15,2017-03-15,2017-03-14
15,3,5,1,+,2016-11-15,2017-04-15,2017-04-14
23,-3,1,0,-,2016-10-23,2016-11-23,2016-11-22
23,-2,1,0,-,2016-09-23,2016-10-23,2016-10-22
23,-1,1,0,-,2016-08-23,2016-09-23,2016-09-22
23,0,1,0,-,2016-07-23,2016-08-23,2016-08-22
23,1,1,0,-,2016-06-23,2016-07-23,2016-07-22
23,2,1,0,-,2016-05-23,2016-06-23,2016-06-22
23,3,1,0,-,2016-04-23,2016-05-23,2016-05-22
23,-3,5,0,-,2017-10-23,2018-03-23,2018-03-22
23,-2,5,0,-,2017-05-23,2017-10-23,2017-10-22
23,-1,5,0,-,2016-12-23,2017-05-23,2017-05-22
23,0,5,0,-,2016-07-23,2016-12-23,2016-12-22
23,1,5,0,-,2016-02-23,2016-07-23,2016-07-22
23,2,5,0,-,2015-09-23,2016-02-23,2016-02-22
23,3,5,0,-,2015-04-23,2015-09-23,2015-09-22
23,-3,5,1,-,2016-06-23,2016-11-23,2016-11-22
23,-2,5,1,-,2016-05-23,2016-10-23,2016-10-22
23,-1,5,1,-,2016-04-23,2016-09-23,2016-09-22
23,0,5,1,-,2016-03-23,2016-08-23,2016-08-22
23,1,5,1,-,2016-02-23,2016-07-23,2016-07-22
23,2,5,1,-,2016-01-23,2016-06-23,2016-06-22
23,3,5,1,-,2015-12-23,2016-05-23,2016-05-22
23,-3,1,0,+,2016-04-23,2016-05-23,2016-05-22
23,-2,1,0,+,2016-05-23,2016-06-23,2016-06-22
23,-1,1,0,+,2016-06-23,2016-07-23,2016-07-22
23,0,1,0,+,2016-07-23,2016-08-23,2016-08-22
23,1,1,0,+,2016-08-23,2016-09-23,2016-09-22
23,2,1,0,+,2016-09-23,2016-10-23,2016-10-22
23,3,1,0,+,2016-10-23,2016-11-23,2016-11-22
23,-3,5,0,+,2015-04-23,2015-09-23,2015-09-22
23,-2,5,0,+,2015-09-23,2016-02-23,2016-02-22
23,-1,5,0,+,2016-02-23,2016-07-23,2016-07-22
23,0,5,0,+,2016-07-23,2016-12-23,2016-12-22
23,1,5,0,+,2016-12-23,2017-05-23,2017-05-22
23,2,5,0,+,2017-05-23,2017-10-23,2017-10-22
23,3,5,0,+,2017-10-23,2018-03-23,2018-03-22
23,-3,5,1,+,2016-04-23,2016-09-23,2016-09-22
23,-2,5,1,+,2016-05-23,2016-10-23,2016-10-22
23,-1,5,1,+,2016-06-23,2016-11-23,2016-11-22
23,0,5,1,+,2016-07-23,2016-12-23,2016-12-22
23,1,5,1,+,2016-08-23,2017-01-23,2017-01-22
23,2,5,1,+,2016-09-23,2017-02-23,2017-02-22
23,3,5,1,+,2016-10-23,2017-03-23,2017-03-22
