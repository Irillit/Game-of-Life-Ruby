require 'pp'

#gracefully calculate nighbours for non edge
def caculate_neghbours(x,y)
	i = x - 1
	j = y - 1
	sum = 0
	while i < x + 2 do

		prev_i = i
		if i < 0 then
			i = $height - 1
		elsif i > ($height - 1) then
			i = 0
		end

		while j < y + 2 do
				#we don't need to calculate central point
				if (i != x or j != y) then 
					#should be better way
					prev_j = j
					if j < 0 then
						j = $width - 1
					elsif j > ($width - 1) then
						j = 0
					end
					sum += $univerce[i][j]

					j = prev_j

					end
				j += 1
			end
			i = prev_i
			j = y - 1
			i += 1
		end
	return sum
	end

def lifecycle
	temp = Array.new($height) { Array.new($width, 0) }
	#doesn't let me use 11
	(0..($height - 1)).each do |i|
		(0..($width - 1)).each do |j|
			neigh = caculate_neghbours(i,j)
			if neigh > 3 then
				temp[i][j] = 0
			elsif  neigh == 3 then
				temp[i][j] = 1
			elsif  neigh < 2 then
				temp[i][j] = 0
			else
				temp[i][j] = $univerce[i][j]
			end
		end
	end
	$univerce = temp 
end

def uniprint
	(0..($height - 1)).each do |i|
		(0..($width - 1)).each do |j|
			if $univerce[i][j] == 0 then
				print "  "
			else 
				print " *"
			end
			end
			puts ""
		end
end

$height = 12
$width = 18

$univerce = Array.new($height) { Array.new($width, 0) }

#initial figure
$univerce[0][3]=1
$univerce[1][3]=1
$univerce[2][3]=1
$univerce[2][2]=1
$univerce[1][1]=1

system "clear"
uniprint

#x = caculate_neghbours(0, 0)
#print x
(1..10).each do
	lifecycle
	sleep 1.2
	system "clear"
	uniprint
	end