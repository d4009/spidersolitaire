import java.util.Collections;
import java.util.Stack;

public static class Constants { 
  // card value
  public static final int ACE = 1;
  public static final int TWO = 2;
  public static final int THREE = 3;
  public static final int FOUR = 4;
  public static final int FIVE = 5;
  public static final int SIX = 6;
  public static final int SEVEN = 7;
  public static final int EIGHT = 8;
  public static final int NINE = 9;
  public static final int TEN = 10;
  public static final int JACK = 11;
  public static final int QUEEN = 12;
  public static final int KING = 13;
  
  // card suit
  public static final int HEART = 4;
  public static final int DIAMOND = 3;
  public static final int CLUB = 2;
  public static final int SPADE = 1;
  
  // Game constants
  public static final int MAINMENU = 0;
  public static final int PLAYING = 1;
  public static final int ENDGAME = 2;
  
  // Graphics
  public static final int CARD_WIDTH = 40;
  public static final int CARD_HEIGHT = 60;
  public static final int SUIT_WIDTH = 30;
  public static final int SUIT_HEIGHT = 30;
  
  public static PImage cardBackImg;
  public static PImage cardHeartImg;
  public static PImage cardDiamondImg;
  public static PImage cardClubImg;
  public static PImage cardSpadeImg;
}

public class Color {
  public int R,G,B;
  
  public Color(int R, int G, int B) {
    this.R = R;
    this.G = G;
    this.B = B;
  }
}

public class Card {
  private int value;
  private int suit;
  private boolean status;
  
  public Card(int value, int suit) {
    this.value = value;
    this.suit = suit;
    status = false;
  }
  
  public int getValue() {
    return value;
  }
  
  public String getValueString() {
    switch (value) {
      case Constants.ACE: return "A";
      case Constants.TWO: return "2";
      case Constants.THREE: return "3";
      case Constants.FOUR: return "4";
      case Constants.FIVE: return "5";
      case Constants.SIX: return "6";
      case Constants.SEVEN: return "7";
      case Constants.EIGHT: return "8";
      case Constants.NINE: return "9";
      case Constants.TEN: return "10";
      case Constants.JACK: return "J";
      case Constants.QUEEN: return "Q";
      case Constants.KING: return "K";
    }
    return "";
  }
  
  public Color getColor() {
    if (suit == Constants.HEART || suit == Constants.DIAMOND) {
      return new Color(255, 0, 0);
    } else {
      return new Color(0, 0, 0);
    }
  }
  
  public int getSuit() {
    return suit;
  }
  
  public PImage getSuitImg() {
    switch (suit) {
      case Constants.HEART: 
        return Constants.cardHeartImg;
      case Constants.DIAMOND:
        return Constants.cardDiamondImg;
      case Constants.CLUB:
        return Constants.cardClubImg;
      case Constants.SPADE:
        return Constants.cardSpadeImg;
    }
    return null;
  }
  
  public boolean getStatus() {
    return status;
  }
  
  public void flip() {
    status = !status;
  }
}

public class Position {
  public int x,y;
  
  public Position(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

int gameScreen = 0;

Stack<Card> Deck = new Stack<Card>();

PFont cardFont;

void setup() {
  for (int i = 0; i < 2; i++) {
    for (int suit = Constants.SPADE; suit <= Constants.HEART; suit++) {
      for (int value = Constants.ACE; value <= Constants.KING; value++) {
        Deck.push(new Card(value, suit));
      }
    }
  }
  Collections.shuffle(Deck);
  
  // graphical initializations
  size(900, 600);
  cardFont = createFont("Arial", 10, true);
  Constants.cardBackImg = loadImage("assets/cardback.png");
  Constants.cardHeartImg = loadImage("assets/heart.png");
  Constants.cardDiamondImg = loadImage("assets/diamond.png");
  Constants.cardClubImg = loadImage("assets/club.png");
  Constants.cardSpadeImg = loadImage("assets/spade.png");
}

void draw() {
  if (gameScreen == Constants.MAINMENU) {
    drawMainMenu();
  } else if (gameScreen == Constants.PLAYING) {
    drawPlaying();
  } else if (gameScreen == Constants.ENDGAME) {
    drawEndGame();
  }
}

void drawMainMenu() {
  drawCard(new Card(1,4), new Position(5,5));
}

void drawPlaying() {
  
}

void drawEndGame() {
  
}

void drawCard(Card card, Position pos) {
  if (!card.getStatus()) {
    textFont(cardFont);
    fill(255);
    stroke(0);
    rect(pos.x, pos.y, pos.x + Constants.CARD_WIDTH, pos.y + Constants.CARD_HEIGHT);
    fill(card.getColor().R, card.getColor().G, card.getColor().B);
    text(card.getValueString(), pos.x + 5, pos.y + 13); 
    image(Constants.cardHeartImg, pos.x + ((float)Constants.CARD_WIDTH)/2 - ((float)Constants.SUIT_WIDTH)/2, pos.y + ((float)Constants.CARD_HEIGHT)/2 - ((float)Constants.SUIT_HEIGHT)/2, Constants.SUIT_WIDTH, Constants.SUIT_HEIGHT);
  } else {
    image(Constants.cardBackImg, pos.x, pos.y, Constants.CARD_WIDTH, Constants.CARD_HEIGHT);
  }
}