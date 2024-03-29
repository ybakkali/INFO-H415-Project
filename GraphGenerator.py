from neo4j import GraphDatabase
import xml.etree.ElementTree as ET
import sys


TagToNode = {
	"article":"Article","inproceedings":"Inproceedings","proceedings":"Proceedings",
	"book":"Book","incollection":"Incollection","phdthesis":"PHDThesis","mastersthesis":"MastersThesis",
	"www":"WWW","person":"Person","data":"Data"}


def progress_bar(total, progress):
    bar_length, status = 20, ""
    progress = progress / total

    if progress >= 1:
        progress, status = 1, "\r\n"
    block = int(round(bar_length * progress))
    text = "\rProcessing of {} items [{}] {:.0f}% {}".format(total,
                                                             "#" * block + "-" * (bar_length - block),
                                                             round(progress * 100, 0), status)
    sys.stdout.write(text)
    sys.stdout.flush()

def createPublicationNode(publication):
	query = "MERGE (a:Publication" + " {key: \"" + publication.attrib["key"] + "\"})\n"	

	query += "SET a:" + TagToNode[publication.tag] + "\n"

	if "mdate" in publication.keys():
		query += "SET a.mdate = \"" + publication.attrib["mdate"] + "\"\n"
		
	if "publtype" in publication.keys():
		query += "SET a.publtype = \"" + publication.attrib["publtype"] + "\"\n"
	
	if "reviewid" in publication.keys():
		query += "SET a.reviewid = \"" + publication.attrib["reviewid"] + "\"\n"
	
	if "rating" in publication.keys():
		query += "SET a.rating = \"" + publication.attrib["rating"] + "\"\n"
	
	if "cdate" in publication.keys():
		query += "SET a.cdate = \"" + publication.attrib["cdate"] + "\"\n"
	
	return query


def createRelations(info):
	text = info.text.replace("\\","\\\\")
	text = "\"" + text.replace("\"", "\\\"") + "\""
	if info.tag == "author":
		return "MERGE (p:Person {name: " + text +"})\nMERGE (p)<-[:author]-(a)\n"
		
	elif info.tag == "editor":
		return "MERGE (p:Person {name: " + text +"})\nMERGE (p)<-[:editor]-(a)\n"
	
	elif info.tag == "title":
		return "SET a.title = " + text + "\n"

	elif info.tag == "booktitle":
		return "SET a.booktitle = " + text + "\n"

	elif info.tag == "pages":
		return "SET a.pages = " + text + "\n"

	elif info.tag == "year":
		return "MERGE (y:Year {year: " + text[1:-1] +"})\nMERGE (y)<-[:year]-(a)\n"

	elif info.tag == "address":
		return "SET a.address = " + text + "\n"

	elif info.tag == "journal":
		return "MERGE (j:Journal {name: " + text +"})\nMERGE (j)<-[:journal]-(a)\n"

	elif info.tag == "volume":
		return "SET a.volume = " + text + "\n"

	elif info.tag == "number":
		return "SET a.number = " + text + "\n"

	elif info.tag == "month":
		return "SET a.month = " + text + "\n"

	elif info.tag == "url":
		return "SET a.url = " + text + "\n"

	elif info.tag == "ee":
		return "SET a.ee = " + text + "\n"

	elif info.tag == "cdrom":
		return "SET a.cdrom = " + text + "\n"

	elif info.tag == "cite" and text != "\"...\"":
		return "MERGE (c:Publication {key: " + text +"})\nMERGE (c)<-[:cite]-(a)\n"

	elif info.tag == "publisher":
		return "MERGE (p:Publisher {name: " + text +"})\nMERGE (p)<-[:publisher]-(a)\n"

	elif info.tag == "note":
		return "SET a.note = " + text + "\n"

	elif info.tag == "crossref":
		return "MERGE (c:Publication {key: " + text +"})\nMERGE (c)<-[:crossref]-(a)\n"

	elif info.tag == "isbn":
		return "SET a.isbn = " + text + "\n"

	elif info.tag == "series":
		return "MERGE (s:Series {name: " + text +"})\nMERGE (s)<-[:series]-(a)\n"

	elif info.tag == "school":
		return "MERGE (s:School {name: " + text +"})\nMERGE (s)<-[:school]-(a)\n"

	elif info.tag == "chapter":
		return "SET a.chapter = " + text + "\n"

	elif info.tag == "publnr":
		return "SET a.publnr = " + text + "\n"
	
	else:
		return ""

def main(file, username, password):
	driver = GraphDatabase.driver("neo4j://127.0.0.1:7687", auth=(username, password))
	session = driver.session()
	
	tree = ET.parse(file)
	root = tree.getroot()

	n = 15000
	xml_list = [elem for elem in root][:n]

	i = 0
	for publication in xml_list:
		progress_bar(len(xml_list), i + 1)
		query = createPublicationNode(publication)

		for info in publication:
			query += createRelations(info) + "WITH a\n"
	
		session.run(query+"RETURN NULL")
		
		i += 1

	session.close()
	driver.close()
		
main(sys.argv[1], sys.argv[2], sys.argv[3])
