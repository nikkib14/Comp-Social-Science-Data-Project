find_reddit = function(my.search, my.search2){
  library(pushshiftr)
  my.search = "Nationalist"
  my.search2 = "Communist"
  print(c(my.search, my.search2))
  
  subsNew = ps_search(type = c("comment", "submission", "subreddit"),
    search_terms = c(my.search, my.search2),
    before = "2022-12-1")
  
  subs = head(find_subreddits(my.search))
  subs2 = head(find_subreddits(my.search2))

  Sys.sleep(5)
  links = head(find_thread_urls(
    keywords = NA,
    sort_by = "top",
    subreddit = subs$subreddit,
    period = "all"
  ))


  Sys.sleep(5)
  links2 = head(find_thread_urls(
    keywords = NA,
    sort_by = "top",
    subreddit = subs2$subreddit,
    period = "all"
  ))

  new = get_thread_content(links$url)
  new2 = get_thread_content(links2$url)

  total = merge(new$threads, new$comments, by="url")
  total2 = merge(new2$threads, new2$comments, by="url")

  total = subset(total, select=c("title", "subreddit", "comment"))%>%
    group_by(subreddit)
  total2 = subset(total2, select=c("title", "subreddit", "comment"))%>%
    group_by(subreddit)
  
  
  list = as.character(total)
  list2 = as.character(total2)
  
  
  tblee = tibble(list)
  tblee2 = tibble(list2)
  
  afinn = tblee %>% 
    unnest_tokens(word, list)%>% 
    inner_join(get_sentiments("afinn"))
  
  afinn2 = tblee2 %>% 
    unnest_tokens(word, list2)%>% 
    inner_join(get_sentiments("afinn")) 
  
  afinn = as.data.frame(do.call(cbind, afinn)) 
  afinn2 = as.data.frame(do.call(cbind, afinn2)) 
  
 print("Here are the Reddit Communities chosen for the first selected topic:")
 cat(subs$subreddit)
 
 hist(as.numeric(afinn$value), main = my.search, 
      xlab = ("Sentiment Score"))
 hist(as.numeric(afinn2$value), main = my.search2, 
      xlab = ("Sentiment Score"))
 
 print("Here are the Reddit Communities chosen for the second selected topic:")
 cat(subs2$subreddit)
}
