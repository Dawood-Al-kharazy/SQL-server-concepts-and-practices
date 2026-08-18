---     case statement       ---

select FirstName, LastName, GenderTitle=
	case
		when Gendor='f' then 'fmale'
		when Gendor='m' then 'male'
		else 'unknown'
	end
from Employees
