function IpToCountry(IP)
{
	local result, query, IPsplit = split( IP, "." );
	if ( !secondarydb ) return "Database not connected!";
	if ( IP == "127.0.0.1" ) return "Local-Host";
	if ( IPsplit.len() != 4 ) return "Invalid IP";
	result = QuerySQL(secondarydb, "SELECT Country FROM countrydetected WHERE ((" + IPsplit[0].tointeger() + " * 16777216) + (" + IPsplit[1].tointeger() + " * 65536) + (" + IPsplit[2].tointeger() + " * 256) + " + IPsplit[3].tointeger() + ") BETWEEN Ip_From AND Ip_to LIMIT 1");
	query = GetSQLColumnData( result, 0 );
	if ( !query ) query = "Unknown";
	FreeSQLQuery( result );
	return query;
}	