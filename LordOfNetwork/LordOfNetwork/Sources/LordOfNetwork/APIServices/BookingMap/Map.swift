import Foundation

// swiftlint:disable file_length
// swiftlint:disable type_body_length
class Map: IMap {
    func getParkingMap(completion: @escaping (Result<BookingMap, Error>) -> Void) {
        guard let data = JSON.data(using: .utf8) else {
            completion(.failure(NSError(domain: "Error data", code: 666)))
            return
        }
        let map = try? JSONDecoder().decode(BookingMap.self, from: data)

        if let map = map {
            completion(.success(map))
        } else {
            completion(.failure(NSError(domain: "Error data", code: 666)))
        }
    }

    private let JSON = """
    {
        "name": "Test Building",
        "address": "Алексеевская, 10 / Октябрьская, 16",
        "numberOfLevels": 3,
        "levels": [
            {
                "layerName": "Level 1",
                "numberOfSpots": 66,
                "canvas": {
                    "width": 1222,
                    "height": 1614
                },
                "spots": [
                    {
                        "parkingNumber": "A1",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 329,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "A2",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "D1",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 409
                        }
                    },
                    {
                        "parkingNumber": "G1",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 1065
                        }
                    },
                    {
                        "parkingNumber": "E1",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 561
                        }
                    },
                    {
                        "parkingNumber": "F1",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 681,
                            "y": 561
                        }
                    },
                    {
                        "parkingNumber": "E2",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 633
                        }
                    },
                    {
                        "parkingNumber": "F2",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 681,
                            "y": 633
                        }
                    },
                    {
                        "parkingNumber": "E3",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 705
                        }
                    },
                    {
                        "parkingNumber": "F3",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 681,
                            "y": 705
                        }
                    },
                    {
                        "parkingNumber": "E4",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 777
                        }
                    },
                    {
                        "parkingNumber": "F4",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 681,
                            "y": 777
                        }
                    },
                    {
                        "parkingNumber": "E5",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 849
                        }
                    },
                    {
                        "parkingNumber": "F5",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 681,
                            "y": 849
                        }
                    },
                    {
                        "parkingNumber": "E6",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 921
                        }
                    },
                    {
                        "parkingNumber": "F6",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 681,
                            "y": 921
                        }
                    },
                    {
                        "parkingNumber": "E7",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 993
                        }
                    },
                    {
                        "parkingNumber": "F7",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 681,
                            "y": 993
                        }
                    },
                    {
                        "parkingNumber": "D2",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 473,
                            "y": 409
                        }
                    },
                    {
                        "parkingNumber": "G2",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 473,
                            "y": 1065
                        }
                    },
                    {
                        "parkingNumber": "D3",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 545,
                            "y": 409
                        }
                    },
                    {
                        "parkingNumber": "G3",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 545,
                            "y": 1065
                        }
                    },
                    {
                        "parkingNumber": "D4",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 617,
                            "y": 409
                        }
                    },
                    {
                        "parkingNumber": "G4",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 617,
                            "y": 1065
                        }
                    },
                    {
                        "parkingNumber": "D5",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 689,
                            "y": 409
                        }
                    },
                    {
                        "parkingNumber": "G5",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 689,
                            "y": 1065
                        }
                    },
                    {
                        "parkingNumber": "D6",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 761,
                            "y": 409
                        }
                    },
                    {
                        "parkingNumber": "G6",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 761,
                            "y": 1065
                        }
                    },
                    {
                        "parkingNumber": "A3",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 473,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "A4",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 545,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "A5",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 617,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "A6",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 689,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "A7",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 761,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "A8",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 833,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "B1",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 309
                        }
                    },
                    {
                        "parkingNumber": "C1",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 309
                        }
                    },
                    {
                        "parkingNumber": "B2",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 381
                        }
                    },
                    {
                        "parkingNumber": "C2",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 381
                        }
                    },
                    {
                        "parkingNumber": "B3",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 453
                        }
                    },
                    {
                        "parkingNumber": "C3",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 453
                        }
                    },
                    {
                        "parkingNumber": "B4",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 525
                        }
                    },
                    {
                        "parkingNumber": "C4",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 525
                        }
                    },
                    {
                        "parkingNumber": "B5",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 597
                        }
                    },
                    {
                        "parkingNumber": "C5",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 597
                        }
                    },
                    {
                        "parkingNumber": "B6",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 669
                        }
                    },
                    {
                        "parkingNumber": "C6",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 669
                        }
                    },
                    {
                        "parkingNumber": "B7",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 741
                        }
                    },
                    {
                        "parkingNumber": "C7",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 741
                        }
                    },
                    {
                        "parkingNumber": "B8",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 813
                        }
                    },
                    {
                        "parkingNumber": "C8",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 813
                        }
                    },
                    {
                        "parkingNumber": "B9",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 885
                        }
                    },
                    {
                        "parkingNumber": "C9",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 885
                        }
                    },
                    {
                        "parkingNumber": "B10",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 957
                        }
                    },
                    {
                        "parkingNumber": "C10",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 957
                        }
                    },
                    {
                        "parkingNumber": "B11",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 1029
                        }
                    },
                    {
                        "parkingNumber": "C11",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 1029
                        }
                    },
                    {
                        "parkingNumber": "B12",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 1101
                        }
                    },
                    {
                        "parkingNumber": "C12",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 1101
                        }
                    },
                    {
                        "parkingNumber": "B13",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 1173
                        }
                    },
                    {
                        "parkingNumber": "C13",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 1173
                        }
                    },
                    {
                        "parkingNumber": "B14",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 1245
                        }
                    },
                    {
                        "parkingNumber": "C14",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 932,
                            "y": 1245
                        }
                    },
                    {
                        "parkingNumber": "H1",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 329,
                            "y": 1324
                        }
                    },
                    {
                        "parkingNumber": "H2",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 1324
                        }
                    },
                    {
                        "parkingNumber": "H3",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 473,
                            "y": 1324
                        }
                    },
                    {
                        "parkingNumber": "H4",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 545,
                            "y": 1324
                        }
                    }
                ]
            },
            {
                "layerName": "Level 2",
                "numberOfSpots": 16,
                "canvas": {
                    "width": 1043,
                    "height": 1023
                },
                "spots": [
                    {
                        "parkingNumber": "J1",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 329,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "K1",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 309
                        }
                    },
                    {
                        "parkingNumber": "K2",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 381
                        }
                    },
                    {
                        "parkingNumber": "K3",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 453
                        }
                    },
                    {
                        "parkingNumber": "K4",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 525
                        }
                    },
                    {
                        "parkingNumber": "K5",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 597
                        }
                    },
                    {
                        "parkingNumber": "K6",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 669
                        }
                    },
                    {
                        "parkingNumber": "K7",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 741
                        }
                    },
                    {
                        "parkingNumber": "K8",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 140,
                            "height": 60
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 813
                        }
                    },
                    {
                        "parkingNumber": "J2",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 401,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "J3",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 473,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "J4",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 545,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "J5",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 617,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "J6",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 689,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "J7",
                        "isAvailable": true,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 761,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "J8",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 833,
                            "y": 150
                        }
                    }
                ]
            },
            {
                "layerName": "Level 3",
                "numberOfSpots": 8,
                "canvas": {
                    "width": 864,
                    "height": 440
                },
                "spots": [
                    {
                        "parkingNumber": "L1",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 150,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "L2",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 222,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "L3",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 294,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "L4",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 366,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "L5",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 438,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "L6",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 510,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "L7",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 582,
                            "y": 150
                        }
                    },
                    {
                        "parkingNumber": "L8",
                        "isAvailable": false,
                        "isFree": true,
                        "canvas": {
                            "width": 60,
                            "height": 140
                        },
                        "onCanvasCoords": {
                            "x": 654,
                            "y": 150
                        }
                    }
                ]
            }
        ]
    }
    """
}
