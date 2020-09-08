$c->{theme} = "uol-eprints-theme";

# # USER LOGIN (overwrites function in user_login.pl)
# # JLRS - 2012-09-06
# # COPIED FROM http://wiki.eprints.org/w/LDAP

#     $c->{check_user_password} = sub {
#     my( $session, $username, $password ) = @_;
    
#     # LDAP authentication for "user", "editor" and "admin" types (roles)
#     use Net::LDAP; # IO::Socket::SSL also required

#     # LDAP tunables
#     my $ldap_host = "ds.ddns.leeds.ac.uk";
#     my $base      = "DC=ds,DC=leeds,DC=ac,DC=uk";
#     my $dn        = "CN=ldapproxy,OU=System Accounts,OU=ISS,OU=ACS,OU=Resources,$base";
    
#     my $ldap      = Net::LDAP->new ( $ldap_host, version => 3 );
#     unless( $ldap )
#     {
#         print STDERR "LDAP error: $@\n";
#         return 0;
#     }
    
#     # Start secure connection (not needed if using LDAPS)
#     my $ssl = $ldap->start_tls();
#     if( $ssl->code() )
#     {
#         print STDERR "LDAP SSL error: " . $ssl->error() . "\n";
#         return 0;
#     }
    
#     # Get password for the search-bind-account
#     my $repository = $session->get_repository;
#     my $id         = $repository->get_id;
#     my $ldappass   = `cat /usr/share/eprints/archives/$id/cfg/ldap.passwd`;
#     chomp($ldappass);
    
#     my $bindmesg = $ldap->bind( $dn, password=>$ldappass );
#     if( $bindmesg->code() )
#     {
#         print STDERR "LDAP Bind error: " . $bindmesg->error() . "\n";
#         return 0;
#     }
    
#     # Distinguished name (and attribues needed later on) for this user
#     my $result = $ldap->search (
#         base    => "$base",
#         scope   => "subtree",
#         filter  => "(samaccountname=$username)",
#     # JLRS Might want to add something like:
#     #       attrs   =>  ['1.1', 'uid', 'sn', 'givenname', 'mail'],
#         attrs   =>  [ ],
#         sizelimit=>1
#     );

#     my $entr = $result->pop_entry;

#     unless( defined $entr )
#     {
#         # Allow local EPrints authentication for admins and editors (accounts not found in LDAP)
#         my $user = EPrints::DataObj::User::user_with_username( $session, $username );
#         return 0 unless $user;
        
#         my $user_type = $user->get_type;
#         if( ( $user_type eq "admin" ) || ( $user_type eq "editor" ) )
#         {
#             # internal authentication for "admin" type
#             return $session->get_database->valid_login( $username, $password );
#         }
#         return 0;
#     }

#     my $ldap_dn = $entr->dn;
    
#     # Check password
#     my $mesg = $ldap->bind( $ldap_dn, password => $password );
#     if( $mesg->code() )
#     {
#         return 0;
#     }
    
#     # Does account already exist?
#     my $user = EPrints::DataObj::User::user_with_username( $session, $username );
#     if( !defined $user )
#     {
#         # New account
#         $user = EPrints::DataObj::User::create( $session, "user" );
#         $user->set_value( "username", $username );
#     }
    
#     # Set metadata
#     my $name = {};
#     # 'known as' name doesn't appear as it's own attribute.
#     # It's available in LURCIS (Known_As), but not in LDAP.
#     # we probably should do something like 
#     # strip surname from $entr->displayname  
#     # but I don't know if that's bombproof either.
#     $name->{family} = $entr->get_value( "sn" );
#     $name->{given} = $entr->get_value( "givenName" );
#     $user->set_value( "name", $name );
#     $user->set_value( "username", $username );
#     $user->set_value( "email", $entr->get_value( "mail" ) );
#     $user->commit();
    
#     $ldap->unbind if $ldap;
#     return 1;
#     }

