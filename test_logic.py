from mylib.logic import wiki, search_wiki, phrase


def test_wiki():
    assert "god" in wiki()


def test_search():
    assert "Barack Obama" in search_wiki("Barack Obama")


def test_phrase():
    assert "american politician" in phrase("Obama")
