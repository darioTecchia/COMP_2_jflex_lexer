import java.io.IOException;

public class Tester {

	public static void main(String[] args) throws IOException {

		Lexer lexicalAnalyzer = new Lexer();
		String filePath = args[0];

		if (lexicalAnalyzer.initialize(filePath)) {
			Token token;
			try {
				while ((token = lexicalAnalyzer.nextToken()) != null) {
					if(token.getType() == Token.EOF) {
						break;
					}
					System.out.println(token);
				}
			} catch (Exception e) {
				System.out.println("File parsing ended!!");
			}

		} else {
			System.out.println("File not found!!");
		}
	}

}
