import java.util.*;
char [] vowel = {'a', 'e', 'i', 'o', 'u'};
boolean isQu = false;



public void setup() {
	String lines[] = loadStrings("words.txt");

	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) {
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
}
public int findFirstVowel(String sWord) {
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
	for( int i = 0; i < sWord.length(); i++) {
		for( int j = 0; j < vowel.length; j++) {
			if (sWord.charAt(i) == vowel[j]) {
				if (sWord.charAt(i) == 'u' && sWord.charAt(i-1) == 'q') {
					isQu = true;
					return i;
					
				}
				isQu = false;
				return i;
			}
		}
		
	} 



	return -1;
}

public String pigLatin(String sWord) {
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord

	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	if (findFirstVowel(sWord) == 0) {
		return sWord + "way";
	}
    else if (isQu) {
    	return sWord.substring(findFirstVowel(sWord) + 1 ) + sWord.substring(0, findFirstVowel(sWord) +1 ) + "ay";
    }

	else if(findFirstVowel(sWord) > 0) 
	{
		return sWord.substring(findFirstVowel(sWord) ) + sWord.substring(0, findFirstVowel(sWord) ) + "ay";
	}



	else {
		return "ERROR!";
	}
}
