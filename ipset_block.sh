COUNTRIES_EUROPE="AL AD BY BA BG HR CY CZ DK EE FO FI FR GI GR HU IS IE LV LT LU MK MT MD MC NL NO PL PT RO RU SM RS SK SI ES SE UA VA RS IM RS ME"
COUNTRIES_NORTH_AMERICA="AI AG AW BS BB BZ BM VG KY CR CU CW DM DO SV GL GD GP GT HT HN JM MQ MX PM MS CW KN NI PA PR KN LC PM VC TT TC VI SX BQ SA SE"

SETS="continent_ASIA continent_OCEANIA continent_AFRICA continent_SOUTH_AMERICA"

for C in ${COUNTRIES_EUROPE} ${COUNTRIES_NORTH_AMERICA}; do
SETS="country_${C} $SETS"
done;

for SET in ${SETS}; do
iptables -A INPUT -m set --match-set ${SET} src -p tcp -m tcp --dport 80 -j REJECT 
iptables -A INPUT -m set --match-set ${SET} src -p tcp -m tcp --dport 443 -j REJECT 
done;


