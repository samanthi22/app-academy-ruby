

=begin
We are writing a tool to help users manage their calendars. Given an unordered list of times of day when someone is busy, write a function that tells us whether they're available during a specified period of time.

Each time is expressed as an integer using 24-hour notation, such as 1200 (12:00), 1530 (15:30), or 800 (8:00).

Sample input:

meetings = [
  [1230, 1300],
  [845, 900],
  [1300, 1500]
]

Expected output:

isAvailable(meetings,  830,  845)  => true
isAvailable(meetings, 1330, 1400)  => false
isAvailable(meetings,  830,  930)  => false
isAvailable(meetings,  855,  930)  => false
isAvailable(meetings, 1500, 1600)  => true
isAvailable(meetings,  845,  900)  => false
isAvailable(meetings, 1229, 1231)  => false

=end

meetings = [
    [1230, 1300],
    [845, 900],
    [1300, 1500], 
]

def isAvailable(meetings, start_time, end_time)
  sorted_meetings = {}
  meetings.each do |meeting|
    start_time = meeting[0]
    end_time = meeting[1]
    sorted_meetings[start_time] = end_time
  end
  sorted1_start = sorted_meetings.keys.sort!
  sorted1_end = sorted_meetings.values.sort!
  meeting_start = meeting_start(sorted_meetings, start_time, end_time)
  meeting_end = 900
  isBusy(meeting_start, meeting_end, start_time, end_time)
end 

def meeting_start(meetings, start_time, end_time)
  meetings.each do |key, value|
    if start_time < key.to_i 
      return key 
    end
  end 
   
end 

# check first meeting for availability
def isBusy(meeting_start, meeting_end, start_time, end_time)
    if start_time > meeting_start && end_time < meeting_end
      return true
    end 
  return false
end

puts !isBusy(845, 900, 830, 845)
puts !isBusy(1300, 1500, 1500, 1600)




puts isAvailable(meetings,  830,  845)  #=> true
puts isAvailable(meetings, 1330, 1400)  #=> false
puts isAvailable(meetings,  830,  930)  #=> false
puts isAvailable(meetings,  855,  930)  #=> false
puts isAvailable(meetings, 1500, 1600)  #=> true
puts isAvailable(meetings,  845,  900)  #=> false
puts isAvailable(meetings, 1229, 1231)  #=> false