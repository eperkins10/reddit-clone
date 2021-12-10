//
//  PostListTableViewController.swift
//  Reddit
//
//  Created by Ethan Perkins on 12/1/21.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }

        let post = posts[indexPath.row]
        
        cell.post = post
        
        return cell
    }
    

    
} // end of class

extension PostListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        PostController.fetchPostsWith(searchTerm: searchTerm) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.posts = posts
                    self.tableView.reloadData()
                
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    }
    
    
} // end of class
 
