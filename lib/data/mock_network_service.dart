class MockNetworkService {
  // mocks the post fetching, like and comment submission
  final Map postContent = {
    "ASjdskKJnlkjkJKdsKjmsdsd": {
      "id": "ASjdskKJnlkjkJKdsKjmsdsd",
      "user_name": "Amrutha Subhekar",
      "user_id": "SdUlnkdjfslTJHVnfGFHfssbsfuI",
      "like_count": 10,
      "comment_count": 3,
      "time": "Mar 23, 2021",
      "primary_title": "Crypto Investor Buys \$69 Million Beeple NFT Art Work",
      "primary_description":
          "The latest news to do the rounds is about the investor from Singapore who bought \$ 69 Million Beeple NFT. Now, that sounds too interesting. However, he is not ready to divulge his real name. In a world like ours, anyone can attack him for his funds. I just learnt that this wealthy investor goes by the name Metakovan. It is a record of sorts in the bitcoin genre. The record-breaking digital artwork is connected to an image file that is connected to a NFT.",
      "secondary_description": [
        {
          "title": null,
          "description":
              'You will be amazed to know how lucrative such bitcoins are getting today. Moreover, they are receiving rave reviews. Christie’s Auction House is behind this huge deal. Metakovan also happens to be the chief investor behind Metapurse. It is nothing, but a Crypto-based fund. It is also the largest NFT in the world. At least, that is what it claims to be. Metakovan has also given an interview on Google Hangouts, and states there that it is one lucrative deal. It is a big investment. The artwork in question is interesting.',
        },
        {
          "title": null,
          "description":
              'It is a mosaic of 5,000 artworks. It took him the last 13 years to prepare it. Says, Mike Winkelmann, who goes by the artist whose name is Beeple. One can find a variety of images inside the mosaic artwork. There is Abraham Lincoln spanking baby Trump, and more interesting ones. The bidding happened on 25 February. If reports are to be believed, initially things were a bit mellow, however, it shot up in the last ten minutes.',
        },
        {
          "title": 'Monetization of NFTs',
          "description":
              'Well, this is not the first time Metakovan has done this. He has purchased more such Beeple artworks amounting to \$ 2.2 million in December 2020. Moreover, he fractionalized them and locked them with blockchain. No one even got a whiff of what he was up to. The entire episode has created a sudden gripping interest in NFTs. ',
        },
        {
          "title": null,
          "description":
              'Winkelmann is not ready to divulge any further details yet. Well, Metakovan himself is not planning to sell his shares. This is a historic feat that he has achieved. For the uninitiated, almost 20 million visitors were a part of the auction. And, there were 200 registrations for the bidding. Metakovan was one of them. He has made the payment through ether. This is also a first, for Christie’s. no one has ever received such a large payment in cryptocurrency, in a similar domain. ',
        },
        {
          "title": null,
          "description":
              'This is the third highest amount which has been paid for the artwork of a living artist. So, you can understand how it is. The entire feeling is simply overwhelming. The amount that Metakovan has invested in artwork can actually buy a few palaces in France. You could even buy a yacht or an aeroplane, with that amount of money. ',
        },
        {
          "title": null,
          "description":
              'It seems that the market is quite open now.  And, people like Metakovan can do the unimaginable. Metakovan says that he has no house, or cars. He just loves art and the power of bitcoin. He packs it up and moves on. While the world gushes at him. ',
        },
      ]
    }
  };
  Map comments = {
    'ASjdskKJnlkjkJKdsKjmsdsd': [
      {
        'id': 'SjhsdfjHHGzjhKJHKHHGbmmxhH',
        'commenter_id': 'dfJBmmnnkJKGMNBjHhVVhVVhmskj',
        'commenter_name': 'Anu Jadav',
        'comment': 'Appreciate your Work. Keep writing',
        'time': 'Mar 23, 2021',
      }
    ],
  };
  Future<Map> fetchPosts(String id) async {
    return await Future.delayed(Duration(seconds: 2), () => postContent[id]);
  }

  Future<List<Map>> fetchComments(String id) async {
    return await Future.delayed(Duration(seconds: 2), () => comments[id]);
  }

  Future<Map> fetchLikeCommentCount(String postId) async {
    return await Future.delayed(
        Duration(seconds: 1),
        () => {
              'likes': postContent[postId]['like_count'],
              'comments': postContent[postId]['comment_count']
            });
  }

  Future<Map> appendLikes(String postId) async {
    return await Future.delayed(Duration.zero, () {
      postContent[postId]['like_count'] += 1;
      return {
        'likes': postContent[postId]['like_count'],
        'comments': postContent[postId]['comment_count']
      };
    });
  }

  Future<Map> appendComments(String postId) async {
    return await Future.delayed(Duration.zero, () {
      postContent[postId]['comment_count'] += 1;
      return {
        'likes': postContent[postId]['like_count'],
        'comments': postContent[postId]['comment_count']
      };
    });
  }
}
