import UIKit
class PokeApiViewController: UIViewController{
    
    //Variables
    @IBOutlet weak var pokeListPicker: UIPickerView!
    @IBOutlet weak var pokeTextField: UITextField!
    var viewPokeModel = ViewModelPokemon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPicker()
        bind()
        setUpTextField()
        // Do any additional setup after loading the view.
    }
    
    func setUpPicker(){
        viewPokeModel.getListPokemon()
        pokeListPicker.delegate = self
        pokeListPicker.dataSource = self
    }
    
    func bind() {
        viewPokeModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.pokeListPicker.isHidden = true
            }
        }
    }
    
    func setUpTextField(){
        pokeTextField.delegate = self
        pokeTextField.inputView = pokeListPicker
    }

}


// Extension PokeApiViewController
extension PokeApiViewController: UIPickerViewDelegate, UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewPokeModel.dataArrayPokemonList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewPokeModel.dataArrayPokemonList[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pokeTextField.text = viewPokeModel.dataArrayPokemonList[row].name
        pokeListPicker.isHidden = true
    }
    
}

extension PokeApiViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        pokeListPicker.isHidden = false
        return false
    }
}
