require 'grape'
require_relative './complement_colors_client'

class TrendColorsApi < Grape::API
  TREND_COLORS = {
    2013 => [
      { name: 'Tangerine', hex: '#F79256' },
      { name: 'Custard', hex: '#EAD98B' },
      { name: 'Marsala', hex: '#955251' },
    ],
    2014 => [
      { name: 'Classic Blue', hex: '#1D4E89' },
      { name: 'Toasted Almond', hex: '#D2B29A' },
      { name: 'Strawberry Ice', hex: '#E3868F' },
    ],
    2015 => [
      { name: 'Aquamarine', hex: '#9DC6D8' },
      { name: 'Scuba Blue', hex: '#00B2CA' },
      { name: 'Lucite® Green', hex: '#7DCFB6' },
    ]
  }

end
