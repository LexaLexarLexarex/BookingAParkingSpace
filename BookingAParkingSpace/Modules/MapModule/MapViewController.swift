//
//  MapViewController.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

import Foundation
import LordOfNetwork
import UIKit

protocol IMapView: AnyObject {
    func configureMap(with level: Level)
    func showError(_ error: Error)
    func didSelectSpot(at point: CGPoint)
}

final class MapViewController: UIViewController {
    let presenter: IMapPresenter
    private let view2 = UIView()
    private let mapView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.sizeToFit()
        scroll.minimumZoomScale = 0.4
        scroll.maximumZoomScale = 1
        // scroll.setZoomScale(0.4, animated: false)
        return scroll
    }()

    private var layers: [CALayer] = []

    init(presenter: IMapPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UIScrollViewDelegate

extension MapViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        view2
    }

    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / view2.bounds.width
        let heightScale = size.height / view2.bounds.height
        let scale = min(widthScale, heightScale)
        mapView.minimumZoomScale = scale
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Жизненный цикл

extension MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        presenter.getMap()
    }
}

// MARK: - IMapView

extension MapViewController: IMapView {
    func configureMap(with level: Level) {

        view.addSubview(mapView)
        mapView.snp.makeConstraints { $0.edges.equalToSuperview() }
        mapView.delegate = self
        let shit = CALayer()
        shit.backgroundColor = UIColor.white.cgColor
        mapView.contentSize = .init(width: level.canvas.width, height: level.canvas.height)
        shit.frame = .init(
            x: 0, y: 0,
            width: level.canvas.width,
            height: level.canvas.height
        )
        layers = level.spots.compactMap { spot in
            let layer = setupSpot(spot)
            shit.addSublayer(layer)
            return layer
        }
        view2.frame = shit.frame
        view2.layer.addSublayer(shit)
        mapView.addSubview(view2)
        view2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapScroll(_:))))
    }

    func showError(_ error: Error) {}

    func didSelectSpot(at point: CGPoint) {
        for layer in layers where layer.frame.contains(point) {
            layer.backgroundColor = UIColor.blue.cgColor
        }
    }
}

private extension MapViewController {
    func setupSpot(_ spot: Spot) -> CALayer {
        let spotLayer = CALayer()
        spotLayer.frame = CGRect(
            x: spot.onCanvasCoords.x,
            y: spot.onCanvasCoords.y,
            width: spot.canvas.width,
            height: spot.canvas.height
        )
        spotLayer.fillMode = .both
        if spot.isFree && spot.isAvailable {
            spotLayer.backgroundColor = .freeSpot
        } else {
            spotLayer.backgroundColor = .busySpot
        }
        spotLayer.cornerRadius = 4

        let textLayer = CATextLayer()
        textLayer.position = CGPoint(x: spotLayer.bounds.midX, y: spotLayer.bounds.midY)
        textLayer.bounds = CGRect(x: 0, y: 0, width: spot.canvas.width, height: 30)
        textLayer.string = spot.parkingNumber
        textLayer.alignmentMode = .center
        textLayer.fontSize = 20
        textLayer.foregroundColor = .spotTextColor
        spotLayer.addSublayer(textLayer)
        layers.append(spotLayer)
        return spotLayer
    }

    @objc func didTapScroll(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: view2)
        for spot in layers where spot.frame.contains(point) {
            presenter.didSelectSpace(at: point)
        }
    }
}

private extension CGColor {
    static let spotTextColor: CGColor = UIColor(red: 0.08, green: 0.124, blue: 0.237, alpha: 0.5).cgColor
    static let busySpot: CGColor = UIColor(red: 0.901, green: 0.906, blue: 0.913, alpha: 1).cgColor
    static let freeSpot: CGColor = UIColor(red: 0.755, green: 0.925, blue: 0.762, alpha: 1).cgColor
}
