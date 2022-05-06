def getPushshiftData(query,sub)
    before = 1641013200
    after = 1609477200
    url = 'https://api.pushshift.io/reddit/search/submission/?title='+str(query)+'&size=1000&after='+str(after)+'&before='+str(before)+'&subreddit='+str(sub)
    print(url)
    r = requests.get(url)
    data = json.loads(r.text)
    py_to_r(data)

query, sub = Valorant
