require_relative '../french_ssn'

describe '#french_ssn_info' do
  it 'returns an error message for an invalid number' do
    expected = 'The number is invalid'
    actual = french_ssn_info('999')
    expect(actual).to eq(expected)
  end

  it 'returns the correct message for a valid number' do
    expected = 'a male, born in December, 1984 in Seine-Maritime'
    actual = french_ssn_info('1 84 12 76 451 089 46')
    expect(actual).to eq(expected)
  end
end
