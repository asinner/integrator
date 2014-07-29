module ApplicationHelper
  def application_name
    "Integrator"
  end
  
  def state_names_and_abbreviations
    {
      "Alabama"   	                => "AL",
      "Alaska"	                    => "AK",
      "Arizona"	                    => "AZ",
      "Arkansas"	                  => "AR",
      "California"	                => "CA",
      "Colorado"	                  => "CO",
      "Connecticut"	                => "CT",
      "Delaware"	                  => "DE",
      "Florida"	                    => "FL",
      "Georgia" 	                  => "GA",
      "Hawaii"	                    => "HI",
      "Idaho"	                      => "ID",
      "Illinois"	                  => "IL",
      "Indiana"	                    => "IN",
      "Iowa"	                      => "IA",
      "Kansas"	                    => "KS",
      "Kentucky"	                  => "KY",
      "Louisiana"	                  => "LA",
      "Maine"	                      => "ME",
      "Maryland"	                  => "MD",
      "Massachusetts"	              => "MA",
      "Michigan"	                  => "MI",
      "Minnesota"	                  => "MN",
      "Mississippi"	                => "MS",
      "Missouri"	                  => "MO",
      "Montana"	                    => "MT",
      "Nebraska"	                  => "NE",
      "Nevada"	                    => "NV",
      "New Hampshire"	              => "NH",
      "New Jersey"	                => "NJ",
      "New Mexico"	                => "NM",
      "New York"	                  => "NY",
      "North Carolina"              => "NC",
      "North Dakota"	              => "ND",
      "Ohio"	                      => "OH",
      "Oklahoma"	                  => "OK",
      "Oregon"	                    => "OR",
      "Pennsylvania"	              => "PA",
      "Rhode Island"	              => "RI",
      "South Carolina"              => "SC",
      "South Dakota"	              => "SD",
      "Tennessee"	                  => "TN",
      "Texas"	                      => "TX",  
      "Utah"	                      => "UT",
      "Vermont"	                    => "VT",
      "Virginia"	                  => "VA",
      "Washington"	                => "WA",
      "West Virginia"	              => "WV",
      "Wisconsin"	                  => "WI",
      "Wyoming"	                    => "WY"  
    }
  end
  
  def palette
    ['#00A0B0', '#CC333F', '#EB6841', '#EDC951', '#379F7A', '#78AE62', '#C75233', '#C78933', '#79B5AC', '#5E2F46', '#1B325F', '#3A89C9', '#F26C4F']
  end
  
  def random_hex_color
    "#" + SecureRandom.hex(3)
  end
end
