package plugin::autosum::AutoSum;

use strict;

sub new {
	my $class = shift;
	my $self = {};
	bless $self, $class;
}

sub block {
	my $self = shift;
	my $wiki = shift;
	my $tdata = shift || "";
	my $column = shift || 0;
	my $label = shift || "Total";
	my $currency = shift || "";

	my $data = "";
	my $maxcol = 0;
	my $sum = 0;
	my @rows = split(/\n/, $tdata);
	$data .= ',' . shift(@rows) . "\n";
	foreach(@rows) {
		my $line = $_;
		if($line =~ /,$/){
			$line .= " ";
		}
		my @spl = map {/^"(.*)"$/ ? scalar($_ = $1, s/\"\"/\"/g, $_) : $_}
				($line =~ /,\s*(\"[^\"]*(?:\"\"[^\"]*)*\"|[^,]*)/g);
		if ($maxcol < $#spl) { $maxcol = $#spl; }
		$data .= ',';
		for(my $i = 0; $i < $#spl + 1; $i++) {
			$data .= ',"';
			if($i == $column) {
				$sum += $spl[$i];
				$data .= format_currency($spl[$i], $currency);
			} else {
				$data .= $spl[$i];
			}
			$data .= '"';
		}
		$data .= "\n";
	}

	$data .= ',"\'\'\'' . $label . '\'\'\'",';
	for(my $i = 0; $i < $column; $i++) { $data .= ','; }
	$data .= '"' . format_currency($sum, $currency) . '",';
	for(my $i = $column + 1; $i < $maxcol; $i++) { $data .= ','; }

	return $data;
}

sub format_currency {
	my $data = shift;
	my $currency = shift;
	if($currency eq '') {
		return $data;
	}
	while($data =~ s/(.*\d)(\d\d\d)/$1,$2/){};
	return $currency . $data;
}

1;
