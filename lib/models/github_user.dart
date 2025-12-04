class GithubUser { 
  final String login;      
  final String avatarUrl;  
  final String htmlUrl;    

  GithubUser({ 
    required this.login, 
    required this.avatarUrl, 
    required this.htmlUrl, 
  }); 

  factory GithubUser.fromJson(Map<String, dynamic> json) { 
    return GithubUser( 
      login: json['login'] ?? '', 
      avatarUrl: json['avatar_url'] ?? '', 
      htmlUrl: json['html_url'] ?? '', 
    ); 
  } 
} 
