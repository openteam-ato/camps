class Address < ActiveRecord::Base
  extend Enumerize

  attr_accessible :address_line, :district

  belongs_to :camp

  validates_presence_of :address_line, :district

  enumerize :district, :in => [
    :tomsk,
    :seversk,
    :tomskij,
    :aleksandrovskij,
    :asinovskij,
    :bakcharskij,
    :verhneketskij,
    :zyrjanskij,
    :kargasokskij,
    :kedrovyj,
    :kozhevnikovskij,
    :kolpashevskij,
    :krivosheinskij,
    :molchanovskij,
    :parabelskij,
    :pervomajskij,
    :strezhevoj,
    :teguldetskij,
    :chainskij,
    :shegarskij
  ]
end
