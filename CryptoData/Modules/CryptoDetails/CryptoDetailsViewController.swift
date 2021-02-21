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

class CryptoDetailsViewController: UIViewController {
    
    // MARK: - Attributes
    let viewModel: CryptoDetailsViewModel = CryptoDetailsViewModel()
    
    // MARK: - Views
    let coinLogoImageView: UIImageView
    let coinNameLabel: UILabel
    let priceLabel: UILabel
    
    let logoSize = 30
    
    init(coin: Coin) {
        self.viewModel.coin = coin
        self.coinLogoImageView = UIImageView()
        self.coinNameLabel = UILabel()
        self.priceLabel = UILabel()
        
        super.init(nibName: nil, bundle: nil)
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
    }
    
    private func addSubviews() {
        view.addSubview(coinLogoImageView)
        view.addSubview(coinNameLabel)
        view.addSubview(priceLabel)
    }
    
    private func makeConstraints() {
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
    }
    
    private func makeStyle() {
        coinLogoImageView.layer.cornerRadius = CGFloat(logoSize / 2)
        priceLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    private func setCoinData() {
        coinNameLabel.text = viewModel.coin.name.uppercased()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = ""
        
        if let price = viewModel.coin.price, let formattedPrice = formatter.string(from: NSNumber(value: price)) {
            priceLabel.text = "\(formattedPrice)€"
        }
        if let imageUrl = URL(string: "https://www.cryptocompare.com/\(viewModel.coin.imageUrl)") {
            coinLogoImageView.sd_setImage(with: imageUrl)
        }
    }
}
