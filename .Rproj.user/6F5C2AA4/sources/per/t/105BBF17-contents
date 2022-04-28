library(RedditExtractoR)
library(sentimentr)

find_reddit = function(my.search, my.search2){
  

  print(c(my.search, my.search2))

  subs = head(find_subreddits(my.search))
  subs2 = head(find_subreddits(my.search2))

  links = head(find_thread_urls(subreddit=subs$subreddit, sort_by="top", period="month"))
  links2 = head(find_thread_urls(subreddit=subs2$subreddit, sort_by="top", period="month"))

  new = get_thread_content(links$url)
  new2 = get_thread_content(links2$url)

  total = merge(new$threads, new$comments, by="url")
  total2 = merge(new2$threads, new2$comments, by="url")

  
  #Sentiment Analysis
  #Ranking
  #Display using ggplot

#Do I merge further, or should I just run sentiment analysis from here itself?
#Does data processing/cleaning need to be done in separate file? Probably not.
#Whatever

#  write.csv(total, "C:\\Users\\niloy\\OneDrive\\Documents\\ITI\\SOC_R\\Soc Data Project\\ProjectData1.csv", row.names = FALSE)
#  write.csv(total2, "C:\\Users\\niloy\\OneDrive\\Documents\\ITI\\SOC_R\\Soc Data Project\\ProjectData2.csv", row.names = FALSE)
}