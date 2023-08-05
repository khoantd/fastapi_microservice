import wikipedia


def wiki(name="War Goddness", length=1):
    """This is a wikipedia fetcher"""

    my_wiki = wikipedia.summary(name, length)
    return my_wiki


def search_wiki(name):
    """Search wikipedia for name"""
    results = wikipedia.search(name)
    return results
