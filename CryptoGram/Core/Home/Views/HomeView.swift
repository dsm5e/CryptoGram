//
//  HomeView.swift
//  CryptoGram
//
//  Created by dsm 5e on 17.09.2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false // animate right
    @State private var showPortfolioView: Bool = false // new sheet
    
    @State private var selectedCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    
    var body: some View {
        ZStack {
            
            // background layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
            
            // content layer
            VStack {
                homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                columnTitles
                
                if !showPortfolio {
                    allCoins
                        .transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    portfolioCoins
                        .transition(.move(edge: .trailing))
                }

                Spacer(minLength: 0)
            }
        }
        .background(
            NavigationLink(
                destination: DetailLoadingView(coin: $selectedCoin),
                isActive: $showDetailView,
                label: { EmptyView() })
        )
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
    .environmentObject(HomeViewModel())
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButton(iconName: showPortfolio ? "plus" : "info")
                .background(CircleButtonAnimation(animate: $showPortfolio))
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButton(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.bouncy) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoins: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
                
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoins: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private func segue(coin: CoinModel) {
        selectedCoin = coin
        showDetailView = true
    }
    
    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4, content: {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity( (vm.sortOpption == .rank || vm.sortOpption == .rankReversed) ? 1.0 : 0.0 )
                    .rotationEffect(Angle(degrees: vm.sortOpption == .rank ? 0 : 180))
            })
            .onTapGesture {
                withAnimation {
                    vm.sortOpption = vm.sortOpption == .rank ? .rankReversed : .rank
                }
            }
            
            Spacer()
            
            if showPortfolio {
                HStack(spacing: 4, content: {
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity( (vm.sortOpption == .holdings || vm.sortOpption == .holdingsReversed) ? 1.0 : 0.0 )
                        .rotationEffect(Angle(degrees: vm.sortOpption == .holdings ? 0 : 180))
                })
                .onTapGesture {
                    withAnimation {
                        vm.sortOpption = vm.sortOpption == .holdings ? .holdingsReversed : .holdings
                    }
                }
            }
            
            HStack(spacing: 4, content: {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity( (vm.sortOpption == .price || vm.sortOpption == .priceReversed) ? 1.0 : 0.0 )
                    .rotationEffect(Angle(degrees: vm.sortOpption == .price ? 0 : 180))
            })
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            .onTapGesture {
                withAnimation {
                    vm.sortOpption = vm.sortOpption == .price ? .priceReversed : .price
                }
            }
            
            Button {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "goforward")
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
            
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
