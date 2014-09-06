require 'jaro_winkler'
include JaroWinkler
describe JaroWinkler do
  it 'works' do
    expect(jaro_winkler_distance('MARTHA', 'MARHTA')).to be_within(0.0001).of(0.9611)
    expect(jaro_winkler_distance('DIXON', 'DICKSONX')).to be_within(0.0001).of(0.8133)
    expect(jaro_winkler_distance('abcvwxyz', 'cabvwxyz')).to be_within(0.0001).of(0.9583)
    expect(jaro_winkler_distance('DWAYNE', 'DUANE')).to be_within(0.0001).of(0.84)
    expect(jaro_winkler_distance('tony', 'tony')).to eq 1.0
    expect(jaro_winkler_distance('tonytonyjan', 'tonytonyjan')).to eq 1.0
    expect(jaro_winkler_distance('', '')).to eq 0.0
    expect(jaro_winkler_distance('tony', '')).to eq 0.0
    expect(jaro_winkler_distance('', 'tony')).to eq 0.0
  end

  it 'can ignore case' do
    expect(jaro_winkler_distance('MARTHA', 'marhta', case_match: true)).to be_within(0.0001).of(0.9611)
  end

  it 'can set weight' do
    expect(jaro_winkler_distance('MARTHA', 'MARHTA', weight: 0.2)).to be_within(0.0001).of(0.9778)
    expect{ jaro_winkler_distance('MARTHA', 'MARHTA', weight: 0.26) }.to raise_error
  end
end