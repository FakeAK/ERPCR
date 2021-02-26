//
//  CryptoDetailsViewController.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 21/02/2021.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage
import AAInfographics

final class CryptoDetailsViewController: UIViewController {
    
    // MARK: - Attributes
    let viewModel: CryptoDetailsViewModel = CryptoDetailsViewModel()
    
    // MARK: - Views
    let scrollView: UIScrollView
    let contentView: UIView
    let coinLogoImageView: UIImageView
    let coinNameLabel: UILabel
    let priceLabel: UILabel
    let chartView: AAChartView
    let textFieldsStackView: UIStackView
    let currencyTextField: CurrencyConverterTextField
    let coinTextField: CurrencyConverterTextField
    let buyButton: UIButton
    
    let logoSize = 30
    
    init(coin: Coin) {
        self.viewModel.coin = coin
        self.scrollView = UIScrollView()
        self.contentView = UIView()
        self.coinLogoImageView = UIImageView()
        self.coinNameLabel = UILabel()
        self.priceLabel = UILabel()
        self.chartView = AAChartView()
        self.textFieldsStackView = UIStackView()
        self.currencyTextField = CurrencyConverterTextField()
        self.coinTextField = CurrencyConverterTextField()
        self.currencyTextField.tag = 0
        self.coinTextField.tag = 1
        self.buyButton = UIButton()
        self.buyButton.setTitle("BUY", for: .normal)
        
        super.init(nibName: nil, bundle: nil)
        
        self.currencyTextField.delegate = self
        self.coinTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        makeConstraints()
        makeStyle()
        setCoinData()
        bindViewModel()
        viewModel.fetchVolume()
    }
    
    private func bindViewModel() {
        viewModel.didFetchHistoricalData = { [weak self] historicalData in
            guard let self = self else { return }
            let chartModel = AAChartModel()
                .title("Price over time".uppercased())
                .chartType(.area)
                .animationType(.swingTo)
                .dataLabelsEnabled(false)
                .legendEnabled(false)
                .tooltipEnabled(true)
                .dataLabelsEnabled(false)
                .tooltipValueSuffix("EUR")
                .categories([])
                .colorsTheme(["#fe117c"])
                .series([
                    AASeriesElement()
                        .name(self.viewModel.coin.name)
                        .data(historicalData.map { $0.close }),
                ])
            
            self.chartView.aa_drawChartWithChartModel(chartModel)
            
        }
        
        viewModel.didConvertCurrencyToCoin = { [weak self] coin in
            self?.coinTextField.text = "\(coin)"
        }
        
        viewModel.didConvertCoinToCurrency = { [weak self] currency in
            if let formattedPrice = currency.toString() {
                self?.currencyTextField.text = "\(formattedPrice)€"
            }
        }
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(coinLogoImageView)
        contentView.addSubview(coinNameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(textFieldsStackView)
        contentView.addSubview(buyButton)
        contentView.addSubview(chartView)
        textFieldsStackView.addArrangedSubview(currencyTextField)
        textFieldsStackView.addArrangedSubview(coinTextField)
    }
    
    private func makeConstraints() {
        scrollView.snp.makeConstraints { (scrollView) in
            scrollView.edges.equalToSuperview()
            scrollView.width.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { (contentView) in
            contentView.edges.equalToSuperview()
            contentView.width.equalToSuperview()
        }
        
        coinLogoImageView.snp.makeConstraints { (image) in
            image.top.equalTo(20)
            image.left.equalTo(20)
            image.width.height.equalTo(logoSize)
        }
        
        coinNameLabel.snp.makeConstraints { (label) in
            label.left.equalTo(coinLogoImageView.snp.right).offset(10)
            label.centerY.equalTo(coinLogoImageView.snp.centerY)
        }
        
        priceLabel.snp.makeConstraints { (label) in
            label.top.equalTo(coinLogoImageView.snp.bottom).offset(20)
            label.left.equalTo(20)
        }
        
        textFieldsStackView.snp.makeConstraints { (stackView) in
            stackView.top.equalTo(priceLabel.snp.bottom).offset(20)
            stackView.leading.trailing.equalToSuperview().inset(10)
            stackView.height.equalTo(70)
        }
        
        buyButton.snp.makeConstraints { (button) in
            button.top.equalTo(textFieldsStackView.snp.bottom).offset(20)
            button.width.equalTo(100)
            button.height.equalTo(50)
            button.centerX.equalToSuperview()
        }
        
        chartView.snp.makeConstraints { (chart) in
            chart.top.equalTo(buyButton.snp.bottom).offset(50)
            chart.leading.trailing.equalToSuperview()
            chart.height.equalTo(400)
            chart.bottom.equalToSuperview()
        }
    }
    
    private func makeStyle() {
        coinLogoImageView.layer.cornerRadius = CGFloat(logoSize / 2)
        priceLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        coinNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        coinTextField.layer.borderWidth = 1
        currencyTextField.layer.borderWidth = 1
        coinTextField.layer.borderColor = UIColor.black.cgColor
        currencyTextField.layer.borderColor = UIColor.black.cgColor
        textFieldsStackView.axis = .horizontal
        textFieldsStackView.distribution = .fillEqually;
        textFieldsStackView.alignment = .fill;
        textFieldsStackView.spacing = 10;
        coinTextField.keyboardType = .decimalPad
        currencyTextField.keyboardType = .decimalPad
        coinTextField.layer.cornerRadius = 5
        currencyTextField.layer.cornerRadius = 5
        buyButton.backgroundColor = Colors.confirmColor
        buyButton.layer.cornerRadius = 50 / 2
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    private func setCoinData() {
        coinNameLabel.text = viewModel.coin.name.uppercased()
        
        if let price = viewModel.coin.price.value, let formattedPrice = price.toString() {
            priceLabel.text = "\(formattedPrice)€"
        }
        if let imageUrl = URL(string: "https://www.cryptocompare.com/\(viewModel.coin.imageUrl)") {
            coinLogoImageView.sd_setImage(with: imageUrl)
        }
    }
}

extension CryptoDetailsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if
            let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string),
            let newValue = Double(updatedString) {
            switch textField.tag {
            case 0:
                viewModel.currencyValueDidChange(newValue: newValue)
            case 1:
                viewModel.coinValueDidChange(numberOfCoins: newValue)
            default:
                break
            }
        }
        
        return true
    }
}
