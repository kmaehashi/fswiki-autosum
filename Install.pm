############################################################
#
# AutoSum plug-in provides autosum feature for tables.
#
############################################################

package plugin::autosum::Install;

use strict;

sub install {
	my $wiki = shift;
	$wiki->add_block_plugin("autosum", "plugin::autosum::AutoSum", "WIKI");
}

1;
