//
//  ViewController.swift
//  EmployeeManagement
//
//  Created by Celestial on 21/12/23.
//
//
import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var labelForEmptyState: UILabel!
    @IBOutlet weak var viewForEmptyState: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    //    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Employees.plist")
    var homeViewModel = HomeModelView()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        homeViewModel.loadDetails()
        tableView.reloadData()
    }
    
    //MARK: -TableView Other Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if(editingStyle == .delete)
        {
            homeViewModel.employeeData.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            homeViewModel.saveItem()
            tableView.reloadData()
            if(homeViewModel.employeeData.isEmpty)
            {
                viewForEmptyState.isHidden=false
                labelForEmptyState.text="No Employee Available For Empty State"
            }
            else
            {
                viewForEmptyState.isHidden=true
            }
        }
    }
    //MARK: -TableView Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return homeViewModel.employeeData.count
    }
    
    //MARK: - TableView DeleGAtes Method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        if(homeViewModel.employeeData.isEmpty)
        {
            viewForEmptyState.isHidden = false
            labelForEmptyState.text = "No Employee Available For Empty State"
        }
        else
        {
            viewForEmptyState.isHidden=true
        }
        cell.name.text = homeViewModel.employeeData[indexPath.row].name
        cell.designation.text = homeViewModel.employeeData[indexPath.row].designation
        cell.profileImage.image = homeViewModel.employeeData[indexPath.row].image
        
        // Assign the row index as the tag
        cell.showDetails.tag = indexPath.row
        cell.editDetails.tag = indexPath.row
        
        cell.showDetails.addTarget(self, action: #selector(showDetails(_:)), for: .touchUpInside)
        return cell
    }
    //MARK: -End Of The TableView methods
    @IBAction func addEmployee(_ sender: UIBarButtonItem)
    {
        self.searchBar(self.searchBar, textDidChange: "")
        let modificationVC = self.storyboard?.instantiateViewController(withIdentifier: "ModifyVC") as! ModificationViewController
        modificationVC.delegate = self
        navigationController?.pushViewController(modificationVC, animated: true)
    }
    
    @IBAction func search(_ sender: UIButton)
    {
        filterEmployee()
    }
    //MARK: -Editing Employee
    @IBAction func editDetails(_ sender: UIButton)
    {
        let rowIndex = sender.tag
        self.searchBar(self.searchBar, textDidChange: "")
        let selectedEmployee = homeViewModel.employeeData[rowIndex]
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as? EditViewController else { return }
        viewController.detailsOfEmployee = EditModelView(model: selectedEmployee)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: -Showing details of selected user
    @objc func showDetails(_ sender: UIButton)
    {
        let rowIndex = sender.tag
        let selectedUser = homeViewModel.employeeData[rowIndex]
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsViewController else { return }
        viewController.detailsView = DetailsViewModel(model: selectedUser)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
extension HomeViewController:UISearchBarDelegate,EmployeeData
{
    //MARK: -Custom Protocol Methopds
    func fetchEmployee(employee: Employee)
    {
        self.homeViewModel.employeeData.append(employee)
        self.homeViewModel.saveItem()
        tableView.reloadData()
    }
    
    //MARK: -for SearchField Filter Data and Searching content
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchText.isEmpty
        {
            homeViewModel.loadDetails()
            tableView.reloadData()
        }
        else
        {
            let filteredEmployees = homeViewModel.employeeData.filter { employee in
                
                return employee.name.lowercased().contains(searchText.lowercased())
            }
            homeViewModel.employeeData = filteredEmployees
            tableView.reloadData()
        }
    }
}
