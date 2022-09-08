function firstLetterToUppercase(myText as string) as string
    firstLetter = left(ucase(myText), 1) + right(lCase(myText), myText.len()-1)
    return firstLetter
end function