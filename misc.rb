require 'json'
require 'csv'

#skip json stuff, dump it into csv then sql
# csv_string = CSV.generate do |csv|
#   JSON.parse(File.open("test.json").read).each do |hash|
#     csv << hash.values
#   end
# end

datum = File.read('test.json')

data = JSON.parse(datum)

p data.keys

#array of subjects extracted from json
var = []

#extract subjects from 1 json record
obj['subjects'].each {|x| var << x['identifier']}


catawhat = File.read('test20.json')
catalog = JSON.parse()

allsubj = []
catalog.each {|x| 
  x['subjects'].each {|y| 
    allsubj << y['identifier']}
}

p allsubj

#get unique subjects
subjCounts = allsubj.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
data = subjCounts

#input subjects into PG search
#return count for each
#loop through incrementally


#find subject, return to array specific to each original subject in var

#PG does not allow script search
#searchResults = var.each {|x| HTTParty.get('https://www.gutenberg.org/ebooks/subjects/search/?query={#x}')

#results into JSON groups

#D3 STUFF: static data
#feed JSON groups to d3.js

#<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
function processData(data) { var obj = data.subjCounts   
  var newDataSet = [];   

for(var prop in obj) 
{ newDataSet.push({name: prop, className: prop.toLowerCase(), size: obj[prop]}); } 
return {children: newDataSet}; } 

var nodes = bubble.nodes(processData(data)) .filter(function(d) { return !d.children; }); 

var vis = svg.selectAll('circle') .data(nodes, 
function(d) { return d.name; }); vis.enter().append('circle') .attr('transform', 
function(d) { return 'translate(' + d.x + ',' + d.y + ')'; }) .attr('r', 
function(d) { return d.r; }) .attr('class', function(d) { return d.className; }); 
#template http://www.pubnub.com/blog/fun-with-d3js-data-visualization-eye-candy-with-streaming-json/#sthash.gdQcbKf9.dpuf
