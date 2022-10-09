import nltk
import string
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt

from pattern.en import lemma
from nltk.tokenize import sent_tokenize, TweetTokenizer

tweet = TweetTokenizer()

paragraph = "As a term, data analytics predominantly refers to an assortment of applications, from basic business intelligence (BI), reporting and online analytical processing (OLAP) to various forms of advanced analytics. In that sense, it's similar in nature to business analytics, another umbrella term for approaches to analyzing data -- with the difference that the latter is oriented to business uses, while data analytics has a broader focus. The expansive view of the term isn't universal, though: In some cases, people use data analytics specifically to mean advanced analytics, treating BI as a separate category. Data analytics initiatives can help businesses increase revenues, improve operational efficiency, optimize marketing campaigns and customer service efforts, respond more quickly to emerging market trends and gain a competitive edge over rivals -- all with the ultimate goal of boosting business performance. Depending on the particular application, the data that's analyzed can consist of either historical records or new information that has been processed for real-time analytics uses. In addition, it can come from a mix of internal systems and external data sources. At a high level, data analytics methodologies include exploratory data analysis (EDA), which aims to find patterns and relationships in data, and confirmatory data analysis (CDA), which applies statistical techniques to determine whether hypotheses about a data set are true or false. EDA is often compared to detective work, while CDA is akin to the work of a judge or jury during a court trial -- a distinction first drawn by statistician John W. Tukey in his 1977 book Exploratory Data Analysis. Data analytics can also be separated into quantitative data analysis and qualitative data analysis. The former involves analysis of numerical data with quantifiable variables that can be compared or measured statistically. The qualitative approach is more interpretive -- it focuses on understanding the content of non-numerical data like text, images, audio and video, including common phrases, themes and points of view."

sentences = sent_tokenize(paragraph)

searched_word = 'data'
searched_word_2 = 'analytics'
n_sentences = len(sentences)
word_count_list = np.array([])
searched_word_count_list = np.array([])
searched_word_2_count_list = np.array([])
word_only_paragraph = np.array([])

for sentence in sentences:
    word_count = 0
    searched_word_count = 0
    searched_word_2_count = 0
    text = tweet.tokenize(sentence)
    for word in text:
        if word not in string.punctuation:
            word_only_paragraph = np.append(word_only_paragraph, word)
            word_count += 1
        if word == searched_word:
            searched_word_count += 1
        if searched_word_count > 0 and word == searched_word_2:
            searched_word_2_count += 1
    word_count_list = np.append(word_count_list, word_count)
    searched_word_count_list = np.append(searched_word_count_list, searched_word_count)
    searched_word_2_count_list = np.append(searched_word_2_count_list, searched_word_2_count)

print("Q3. a.")
print("Number of lines in the text paragraph: ", n_sentences)
print("Occurence of "+searched_word+" in each line:", searched_word_count_list)
print("Number of words in each line:", word_count_list)
print("Probability of the word “"+searched_word+"” occurring in each line: ", searched_word_count_list / word_count_list)
print()

print("Q3. b.")
word_only_paragraph_cl = np.array([lemma(wrd) for wrd in np.char.lower(word_only_paragraph)])
fdist = nltk.FreqDist(word_only_paragraph_cl)
fdist_top20 = fdist.most_common(20)
fdist_top20 = dict(fdist_top20)
plt.figure(figsize=(15, 4))
plt.bar(range(len(fdist_top20)), list(fdist_top20.values()), align='center', 
        color=plt.cm.tab20c.colors)
plt.xticks(range(len(fdist_top20)), list(fdist_top20.keys()), rotation=50)
plt.show()
print(dict(sorted(fdist.items(), key=lambda item: item[1], reverse=True)))
print()

print("Q3. c.")
print("Probability of the word “"+searched_word_2+"” occurring after the word “"+searched_word+"”: ", np.sum(searched_word_2_count_list) / np.sum(searched_word_count_list))
