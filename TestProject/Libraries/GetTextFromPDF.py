import textract

def GetPDFText(path):
    text = textract.process(path)
    return text
