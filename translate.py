import subprocess

# Script to extract and generate translation classes

TARGET_FILES = [
	"lib/components/main_app.dart",
	"lib/components/main_menu.dart",
	"lib/components/common_messages.dart",
]
TRANSLATION_FILES = [
	"lib/components/messages_all/translation_jp.arb"
]
TOOL_PATH = "tool"
PACKAGE_ROOT = "packages"
OUTPUT_DIR = "lib/components/messages_all"

def main():
	targetFiles = " ".join(TARGET_FILES)
	translationFiles = " ".join(TRANSLATION_FILES)
	extract = "dart --package-root=%s %s/extract_to_arb.dart --output-dir=%s %s" % (PACKAGE_ROOT, TOOL_PATH, OUTPUT_DIR, targetFiles)
	print(extract)
	p = subprocess.Popen(extract, stdout=subprocess.PIPE)
	p.wait()
	generate = "dart --package-root=%s %s/generate_from_arb.dart --output-dir=%s %s %s" % (PACKAGE_ROOT, TOOL_PATH, OUTPUT_DIR, targetFiles, translationFiles)
	print(generate)
	p = subprocess.Popen(generate, stdout=subprocess.PIPE)
	p.wait()

if __name__ == '__main__':
	main()
