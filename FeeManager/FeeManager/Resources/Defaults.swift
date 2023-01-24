//
//  Defaults.swift
//  FeeManager
//
//  Created by Milovan Arsul on 19.01.2023.
//

import Foundation
import UIKit

let defaults = UserDefaults.standard

let tipulPersoanei: [(Int, String)] = [(1, "Persoană fizică"), (2, "Persoană juridică")]

let judete: [(Int, String)] = [(1, "ALBA"), (2, "ARAD"), (3, "ARGES"), (4, "BACAU"), (5, "BIHOR"), (6, "BISTRITA-NASAUD"), (7, "BOTOSANI"), (8, "BRAILA"), (9, "BRASOV"), (10, "BUCURESTI"), (11, "BUZAU"), (12, "CALARASI"), (13, "CARAS-SEVERIN"), (14, "CLUJ"), (15, "CONSTANTA"), (16, "COVASNA"), (17, "DAMBOVITA"), (18, "DOLJ"), (19, "GALATI"), (20, "GIURGIU"), (21, "GORJ"), (22, "HARGHITA"), (23, "HUNEDOARA"), (24, "IALOMITA"), (25, "IASI"), (26, "ILFOV"), (27, "MARAMURES"), (28, "MEHEDINTI"), (29, "MURES"), (30, "NEAMT"), (31, "OLT"), (32, "PRAHOVA"), (33, "SALAJ"), (34, "SATU MARE"), (35, "SIBIU"), (36, "SUCEAVA"), (37, "TELEORMAN"), (38, "TIMIS"), (39, "TULCEA"), (40, "VALCEA"), (41, "VASLUI"), (42, "VRANCEA")]

let institutie: [String:[(Int, String)]] = [
    "ALBA" : [(9269, "Abrud AB"), (1182, "Aiud AB"), (462, "Alba Iulia AB"), (13287, "Baia de Aries AB"), (2346, "Berghin AB"), (1662, "Blaj AB"), (2647, "Cimpeni AB"), (1842, "Ciugud AB"), (10147, "Cricau AB"), (1162, "Cugir AB"), (13807, "Ighiu AB"), (9168, "Lopadea Noua AB"), (13707, "Metes AB"), (11147, "Mihalt AB"), (6707, "Santimbru AB"), (1822, "Sasciori AB"), (4387, "Sebes AB"), (13947, "Stremt AB"), (4527, "Teius AB"), (16507, "Vintu de Jos AB"), (8347, "Zlatna AB")],
    "ARAD" : [(1982, "Arad AR"), (13251, "Archis AR"), (10548, "Beliu AR"), (9688, "Bocsig AR"), (7167, "Buteni AR"), (11487, "Carand AR"), (6867, "Chisineu Cris AR"), (12567, "Conop AR"), (7307, "Covasant AR"), (2123, "Curtici AR"), (11547, "Dorobanti AR"), (9047, "Fantanele AR"), (9787, "Frumuseni AR"), (7427, "Ghioroc AR"), (7867, "Hasmas AR"), (8707, "Iratosu AR"), (9727, "Macea AR"), (8727, "Misca AR"), (962, "Nădlac AR"), (8768, "Paulis AR"), (6527, "Pecica AR"), (6847, "Sagu AR"), (4128, "Santana AR"), (9827, "Savarsin AR"), (9507, "Sebis AR"), (8987, "Seleus AR"), (8827, "Semlac AR"), (12847, "Sintea Mare AR"), (7451, "Siria AR"), (12107, "Socodor AR"), (8209, "Sofronea AR"), (15387, "Varfurile AR"), (11007, "Vinga AR"), (12087, "Zabrani AR"), (11647, "Zadareni AR"), (10547, "Zarand AR"), (11068, "Zerind AR"), (10607, "Zimandu Nou AR")],
    "ARGES" : [(15467, "Albestii de Muscel AG"), (11167, "Albota AG"), (8567, "Babana AG"), (6907, "Bascov AG"), (15809, "Berevoesti AG"), (6467, "Bradu AG"), (9347, "Budeasa AG"), (13887, "Bughea de Sus AG"), (16447, "Buzoesti AG"), (12207, "Caldararu AG"), (14847, "Calinesti AG"), (14247, "Cetateni AG"), (9588, "Ciofrangeni AG"), (13250, "Corbeni AG"), (6427, "Costesti AG"), (1262, "Curtea de Argeş AG"), (3347, "Câmpulung AG"), (15368, "Draganu AG"), (9528, "Dragoslavele AG"), (10667, "Leordeni AG"), (6528, "Leresti AG"), (9987, "Merisani AG"), (12167, "Micesti AG"), (10488, "Mihaesti AG"), (1782, "Mioveni AG"), (15187, "Miroși AG"), (12007, "Moraresti AG"), (7047, "Mosoaia AG"), (7027, "Musatesti AG"), (4167, "Mărăcineni AG"), (62, "Piteşti AG"), (12827, "Poiana Lacului AG"), (11729, "Poienarii de Arges AG"), (9627, "Priboieni AG"), (14707, "Recea AG"), (10327, "Schitu Golesti AG"), (8307, "Stalpeni AG"), (4827, "Stefănești AG"), (13727, "Stolnici AG"), (10387, "Suseni AG"), (13767, "Titesti AG"), (4367, "Topoloveni AG"), (11789, "Valea Mare Pravat AG"), (14067, "Vedea AG"), (12587, "Vladesti AG"), (15767, "Vulturesti AG")],
    "BACAU" : [(1522, "Bacău BC"), (12787, "Barsanesti BC"), (15587, "Buhoci BC"), (3848, "Buhusi BC"), (16007, "Cleja BC"), (8607, "Colonesti BC"), (7908, "Comanesti BC"), (10310, "Damienesti BC"), (10512, "Darmanesti BC"), (8332, "Dealu Morii BC"), (15568, "Dofteana BC"), (13688, "Faraoani BC"), (15827, "Gaiceana BC"), (10527, "Garleni BC"), (8967, "Gura Vaii BC"), (9267, "Helegiu BC"), (10710, "Hemeius BC"), (14587, "Horgesti BC"), (5267, "Letea Veche BC"), (10088, "Luizi Calugara BC"), (10608, "Manastirea Casin BC"), (11770, "Margineni BC"), (1802, "Moineşti BC"), (12047, "Nicolae Balcescu BC"), (10227, "Oituz BC"), (583, "Oneşti BC"), (9287, "Orbeni BC"), (13307, "Pargaresti BC"), (15447, "Parjol BC"), (9147, "Racaciuni BC"), (13927, "Rosiori BC"), (6987, "Sarata BC"), (9447, "Saucesti BC"), (12710, "Scorteni BC"), (14027, "Secuieni BC"), (7227, "Slanic Moldova BC"), (14348, "Stefan cel Mare BC"), (6708, "Targu Ocna BC"), (14307, "Targu Trotus BC")],
    "BIHOR" : [(11807, "Alesd BH"), (8333, "Bratca BH"), (14768, "Cabesti BH"), (14987, "Copacel BH"), (4607, "Derna BH"), (11947, "Dobresti BH"), (14267, "Girisu de Cris BH"), (1762, "Lugaşu de Jos BH"), (2487, "Marghita BH"), (182, "Oradea BH"), (8547, "Paleu BH"), (14069, "Pomezeu BH"), (12707, "Popesti BH"), (13728, "Rieni BH"), (12709, "Salonta BH"), (8408, "Sanmartin BH"), (4587, "Sântandrei BH"), (14167, "Tetchea BH")],
    "BISTRITA-NASAUD" : [(8328, "Beclean BN"), (923, "Bistrita BN"), (10767, "Ciceu-Mihaiesti BN"), (14927, "Dumitra BN"), (10508, "Ilva Mica BN"), (10987, "Josenii Bargaului BN"), (8627, "Monor BN"), (7568, "Nasaud BN"), (5787, "Prundu Bârgăului BN"), (9449, "Rebra BN"), (12907, "Runcu Salvei BN"), (9487, "Sangeorz-Bai BN"), (14327, "Sieu BN"), (8334, "Sieu-Magherus BN"), (10428, "Silivasu de Campie BN"), (15747, "Tarlisua BN"), (7210, "Telciu BN"), (10247, "Tiha Bargaului BN")],
    "BOTOSANI" : [(522, "Botoşani BT"), (5747, "Bucecea BT"), (12867, "Calarasi BT"), (11987, "Corni BT"), (15847, "Cotusca BT"), (16527, "Curtesti BT"), (2700, "Dangeni BT"), (8867, "Darabani BT"), (5427, "Dorohoi BT"), (6611, "Flamanzi BT"), (2707, "George Enescu BT"), (4407, "Mihai Eminescu BT"), (2787, "Mihalaseni BT"), (6627, "Rauseni BT"), (13227, "Saveni BT"), (6687, "Todireni BT"), (16627, "Tudora BT")
],
    "BRAILA" : [(262, "Brăila BR"), (12287, "Faurei BR"), (1302, "Ianca BR"), (7209, "Insuratei BR"), (12807, "Maxineni BR"), (16307, "Racovita BR"), (13867, "Unirea BR"), (8247, "Vadeni BR")],
    "BRASOV" : [(12247, "Bod BV"), (722, "Bran BV"), (122, "Braşov BV"), (14767, "Budila BV"), (602, "Codlea BV"), (5807, "Cristian BV"), (9687, "Dragus BV"), (2202, "Fagaras BV"), (7028, "Feldioara BV"), (10507, "Fundata BV"), (7447, "Ghimbav BV"), (7448, "Halchiu BV"), (14388, "Harseni BV"), (6727, "Homorod BV"), (4427, "Hărman BV"), (13268, "Lisa BV"), (9450, "Moieciu BV"), (5307, "Măieruș BV"), (8167, "Poiana Marului BV"), (2022, "Predeal BV"), (5707, "Prejmer BV"), (1882, "Rasnov BV"), (15667, "Recea BV"), (11067, "Rupea BV"), (4788, "Sacele BV"), (6387, "Sanpetru BV"), (3407, "Teliu BV"), (8387, "Vama Buzaului BV"), (8447, "Victoria BV"), (5208, "Vulcan BV"), (2907, "Zărneşti BV")],
    "BUCURESTI" : [(502, "Sector 1"), (1, "Sector 2"), (242, "Sector 3"), (543, "Sector 4"), (2102, "Sector 5"), (21, "Sector 6")],
    "BUZAU" : [(2771, "Braesti BZ"), (2676, "Buda BZ"), (425, "Buzău BZ"), (2702, "Cilibia BZ"), (2770, "Costesti BZ"), (2767, "Florica BZ"), (2679, "Ghergheasa BZ"), (2701, "Glodeanu Sărat BZ"), (10790, "Lopatari BZ"), (11867, "Merei BZ"), (6487, "Nehoiu BZ"), (13847, "Patarlagele BZ"), (7687, "Pogoanele BZ"), (5528, "Pîrscov BZ"), (2769, "Robeasca BZ"), (943, "Râmnicu Sărat BZ"), (2673, "Rîmnicelu BZ"), (12727, "Sahateni BZ"), (11847, "Tisau BZ"), (6768, "Unguriu BZ"), (6827, "Vadu Pasii BZ"), (11790, "Valea Ramnicului BZ"), (2768, "Valea Salciei BZ"), (2674, "Verneşti BZ"), (13827, "Vintila Voda BZ")],
    "CALARASI" : [(5587, "Cuza Vodă CL"), (322, "Călăraşi CL"), (15008, "Dichiseni CL"), (14389, "Dor Marunt CL"), (8729, "Dragalina CL"), (12887, "Frumusani CL"), (3707, "Fundulea CL"), (6607, "Jegalia CL"), (12027, "Lehliu-Gara CL"), (15267, "Manastirea CL"), (8269, "Modelu CL"), (2394, "Oltenița CL"), (16147, "Perisoru CL"), (8330, "Roseti CL"), (12447, "Sarulesti CL"), (10407, "Tamadau Mare CL"), (6087, "Ulmeni CL"), (10511, "Ulmu CL"), (11527, "Valea Argovei CL")],
    "CARAS-SEVERIN" : [(2927, "Anina CS"), (3527, "Baile Herculane CS"), (3069, "Bocsa CS"), (1462, "Caransebeș CS"), (10087, "Mehadia CS"), (8335, "Moldova Noua CS"), (11507, "Otelu Rosu CS"), (14667, "Paltinis CS"), (1482, "Resita CS"), (8847, "Slatina-Timis CS")],
    "CLUJ" : [(5567, "Aghireşu CJ"), (7267, "Aiton CJ"), (4767, "Apahida CJ"), (7228, "Aschileu CJ"), (6367, "Baciu CJ"), (7187, "Baisoara CJ"), (7107, "Bontida CJ"), (8730, "Caianu CJ"), (7208, "Calarasi CJ"), (7230, "Calatele CJ"), (8047, "Camarasu CJ"), (8268, "Catcau CJ"), (7327, "Chinteni CJ"), (12708, "Ciucea CJ"), (8448, "Ciurila CJ"), (302, "Cluj-Napoca CJ"), (11627, "Cojocna CJ"), (7207, "Cuzdrioara CJ"), (442, "Câmpia Turzii CJ"), (7647, "Dabaca CJ"), (883, "Dej CJ"), (5127, "Feleacu CJ"), (2182, "Floresti CJ"), (7229, "Garbau CJ"), (682, "Gherla CJ"), (8048, "Gilau CJ"), (424, "Huedin CJ"), (11069, "Iara CJ"), (7548, "Iclod CJ"), (7248, "Jucu CJ"), (9690, "Luna CJ"), (12507, "Manastireni CJ"), (12768, "Margau CJ"), (13087, "Mica CJ"), (6767, "Mihai Viteazu CJ"), (12067, "Mociu CJ"), (7507, "Negreni CJ"), (15027, "Palatca CJ"), (15488, "Panticeu CJ"), (7347, "Poieni CJ"), (15009, "Sacuieu CJ"), (12848, "Sandulesti CJ"), (1222, "Turda CJ"), (14068, "Valea Ierii CJ")],
    "CONSTANTA" : [(9467, "23 August CT"), (9747, "Agigea CT"), (11347, "Albesti CT"), (11310, "Castelu CT"), (1583, "Cernavodă CT"), (9647, "Chirnogeni CT"), (5007, "Corbu CT"), (10308, "Costinesti CT"), (12728, "Crucea CT"), (6147, "Cumpana CT"), (3827, "Eforie CT"), (6610, "Harsova CT"), (13407, "Lumina CT"), (3507, "Mangalia CT"), (6949, "Medgidia CT"), (12927, "Mihail Kogalniceanu CT"), (6207, "Murfatlar CT"), (10867, "Negru Voda CT"), (5367, "Ovidiu CT"), (9547, "Poarta Alba CT"), (15808, "Sacele CT"), (9847, "Saligny CT"), (3367, "Taxe și Impozite Constanta"), (5727, "Techirghiol CT"), (15167, "Topraisar CT"), (10887, "Tuzla CT"), (2282, "Valu lui Traian CT")],
    "COVASNA" : [(15928, "Arcus CV"), (8907, "Baraolt CV"), (9409, "Barcani CV"), (4187, "Covasna CV"), (14888, "Ghidfalău CV"), (11127, "Intorsura Buzaului CV"), (16347, "Moacsa CV"), (9927, "Reci CV"), (1142, "Sfântu Gheorghe CV"), (2222, "Targu Secuiesc CV"), (13427, "Valea Mare CV"), (15287, "Zagon CV")],
    "DAMBOVITA" : [(3787, "Aninoasa DB"), (12588, "Bezdead DB"), (11287, "Bilciuresti DB"), (9411, "Branesti DB"), (4867, "Brezoaele DB"), (8249, "Buciumeni DB"), (14647, "Cojasca DB"), (16227, "Cornatelu DB"), (10007, "Cornesti DB"), (13127, "Crevedia DB"), (13747, "Darmanesti DB"), (10468, "Doicesti DB"), (3847, "Dragomiresti DB"), (1382, "Fieni DB"), (14687, "Glodeni DB"), (6227, "Gura Ocnitei DB"), (3967, "Găești DB"), (6647, "I L Caragiale DB"), (9307, "Malu cu Flori DB"), (13967, "Manesti DB"), (1902, "Moreni DB"), (5247, "Moroeni DB"), (5467, "Niculești DB"), (8107, "Nucet DB"), (10447, "Pietrosita DB"), (2343, "Pucioasa DB"), (4487, "Razvad DB"), (12548, "Salcioara DB"), (4067, "Sotânga DB"), (1402, "Targoviste DB"), (13647, "Tartasesti DB"), (2122, "Titu DB"), (5909, "Ulmi DB"), (8887, "Valea Lunga DB"), (15727, "Visina DB"), (9247, "Voinesti DB"), (16428, "Vulcana Pandele DB"), (1063, "Vulcana-Băi DB")],
    "DOLJ" : [(4688, "Bailesti DJ"), (10427, "Barca DJ"), (14588, "Breasta DJ"), (6027, "Calafat DJ"), (6287, "Carcea DJ"), (12607, "Cosoveni DJ"), (642, "Craiova DJ"), (7787, "Dabuleni DJ"), (6688, "Filiasi DJ"), (14367, "Galicea Mare DJ"), (10628, "Isalnita DJ"), (4987, "Malu Mare DJ"), (8331, "Motatei DJ"), (7927, "Podari DJ"), (13347, "Poiana Mare DJ"), (15887, "Scaesti DJ"), (4408, "Segarcea DJ")],
    "GALATI" : [(3027, "Bereşti- Meria GL"), (12327, "Brahasesti GL"), (8129, "Branistea GL"), (15087, "Corod GL"), (14207, "Foltesti GL"), (382, "Galaţi GL"), (16487, "Ghidigeni GL"), (13027, "Independenta GL"), (8127, "Ivesti GL"), (7147, "Liesti GL"), (10947, "Matca GL"), (14127, "Munteni GL"), (7067, "Pechea GL"), (12347, "Piscu GL"), (12427, "Schela GL"), (4047, "Scinteiesti GL"), (6709, "Sendreni GL"), (8207, "Slobozia Conachi GL"), (11749, "Smardan GL"), (6348, "Targu Bujor Gl"), (2082, "Tecuci GL"), (9107, "Tudor Vladimirescu GL"), (8208, "Tulucesti GL"), (3888, "Valea Marului GL"), (11567, "Vanatori GL")],
    "GIURGIU" : [(14147, "Bolintin Deal GR"), (3687, "Bolintin Vale GR"), (15408, "Bucsani GR"), (15107, "Colibasi GR"), (10687, "Comana GR"), (8289, "Daia GR"), (8027, "Floresti-Stoenesti GR"), (142, "Giurgiu GR"), (11808, "Sabareni GR"), (13327, "Ulmi GR"), (16707, "VARASTI GR")],
    "GORJ" : [(4608, "Arcani GJ"), (6007, "Baia de Fier GJ"), (7707, "Balesti GJ"), (15367, "Bumbești-Jiu GJ"), (13787, "Ciuperceni GJ"), (15247, "Danesti GJ"), (10587, "Dragutesti GJ"), (5067, "Licurici GJ"), (4227, "Motru GJ"), (15647, "Novaci GJ"), (11607, "Pestisani GJ"), (11047, "Polovragi GJ"), (12168, "Prigoria GJ"), (4127, "Rovinari GJ"), (5607, "Scoarta GJ"), (2323, "Targu Carbunesti GJ"), (582, "Targu Jiu GJ"), (7967, "Ticleni GJ"), (14107, "Tismana GJ"), (2302, "Turcineşti GJ")],
    "HARGHITA" : [(2696, "Atid HR"), (2695, "Avrămeşti HR"), (7449, "Baile Tusnad HR"), (9947, "Bilbor HR"), (2703, "Borsec HR"), (2677, "Brădeşti HR"), (3887, "Bălan HR"), (2687, "Ciceu HR"), (2704, "Cirta HR"), (8767, "Ciucsangeorgiu HR"), (2693, "Ciumani HR"), (2909, "Corbu HR"), (2688, "Corund HR"), (2681, "Cristuru Secuiesc HR"), (3268, "Dealu HR"), (2670, "Ditrău HR"), (3147, "Dăneşti HR"), (2691, "Frumoasa HR"), (2367, "Gheorgheni HR"), (2727, "Gălăuţaş HR"), (2698, "Joseni HR"), (12647, "Leliceni HR"), (3547, "Lueta HR"), (2689, "Lupeni HR"), (4687, "Lăzarea HR"), (7788, "Madaras HR"), (2988, "Miercurea Ciuc HR"), (3267, "Mihăileni HR"), (2989, "Mugeni HR"), (1862, "Odorheiu Secuiesc HR"), (3889, "Plăieșii de Jos HR"), (2678, "Praid HR"), (2827, "Păuleni- Ciuc HR"), (4027, "Racu HR"), (2709, "Remetea HR"), (5967, "Sansimion HR"), (2697, "Satu Mare HR"), (14187, "Secuieni HR"), (2807, "Siculeni HR"), (6567, "Subcetate HR"), (2705, "Suseni HR"), (2699, "Sândominic HR"), (2690, "Sânmartin HR"), (2668, "Sântimbru HR"), (2692, "Sîncrăieni HR"), (2694, "Sărmaş HR"), (2669, "Tomesti HR"), (882, "Topliţa HR"), (3167, "Tuşnad HR"), (4087, "Ulieși HR"), (2706, "Vlahita HR"), (2671, "Voşlăbeni HR"), (2667, "Zetea HR"), (2672, "Şimoneşti HR")],
    "HUNEDOARA" : [(8067, "Aninoasa HD"), (3727, "Bacia HD"), (2002, "Brad HD"), (902, "Călan HD"), (7607, "Densus HD"), (742, "Deva HD"), (3668, "Geoagiu HD"), (3427, "Hateg HD"), (542, "Hunedoara HD"), (10309, "Ilia HD"), (4447, "Lupeni HD"), (3669, "Orastie HD"), (8927, "Orastioara de sus HD"), (7847, "Petrila HD"), (843, "Petroşani HD"), (8147, "Romos HD"), (9127, "Santamaria-Orlea HD"), (1584, "Simeria HD"), (5627, "Soimuș HD"), (5987, "Uricani HD"), (6187, "Vetel HD"), (2567, "Vulcan HD")],
    "IALOMITA" : [(11309, "Adancata IL"), (8310, "Amara IL"), (11307, "Barcanesti IL"), (8647, "Cazanesti IL"), (13667, "Ciochina IL"), (13687, "Colelia IL"), (10707, "Fetesti IL"), (13247, "Fierbinti Targ IL"), (13248, "Gheorghe Doja IL"), (8090, "Gheorghe Lazar IL"), (10228, "Movilita IL"), (8327, "Munteni-Buzau IL"), (11827, "Radulesti IL"), (5287, "Reviga IL"), (11107, "Scanteia IL"), (10788, "Sfantu Gheorghe IL"), (342, "Slobozia IL"), (944, "Urziceni IL")],
    "IASI" : [(4667, "Aroneanu IS"), (4267, "Birnova IS"), (8028, "Butea IS"), (3607, "Ciortesti IS"), (6792, "Ciurea IS"), (9567, "Costuleni IS"), (5447, "Cotnari IS"), (6947, "Deleni IS"), (11727, "Focuri IS"), (13047, "Hârlău IS"), (2322, "Iasi IS"), (3927, "Leţcani IS"), (10847, "Mircesti IS"), (1722, "Miroslava IS"), (4627, "Movileni IS"), (5347, "Pascani IS"), (7750, "Popricani IS"), (14607, "Prisăcani IS"), (15407, "Rachiteni IS"), (6347, "Rediu IS"), (15567, "Romanesti IS"), (13467, "Schitu Duca IS"), (4707, "Scobinti IS"), (11308, "Tansa IS"), (5588, "Targu Frumos IS"), (14248, "Tatarusi IS"), (11747, "Tibanesti IS"), (12528, "Tiganasi IS"), (8687, "Tomesti IS"), (5547, "Valea Lupului IS"), (10068, "Valea Seaca IS"), (11769, "Victoria IS"), (5847, "Voinești IS")],
    "ILFOV" : [(9189, "1 Decembrie"), (6167, "Afumati IF"), (4947, "Baloteşti IF"), (12808, "Berceni IF"), (3307, "Bragadiru IF"), (4609, "Branesti IF"), (5047, "Buftea IF"), (14688, "Cernica IF"), (4207, "Chiajna IF"), (3567, "Chitila IF"), (9967, "Ciolpani IF"), (5407, "Ciorogîrla IF"), (4007, "Clinceni IF"), (11168, "Copaceni IF"), (4467, "Corbeanca IF"), (3807, "Cornetu IF"), (11908, "Dascalu IF"), (4147, "Dobroesti IF"), (3869, "Domnesti IF"), (8308, "Dragomiresti Vale IF"), (12367, "Ganeasa  IF"), (6407, "Glina IF"), (12527, "Gradistea IF"), (12387, "Gruiu IF"), (4727, "Jilava IF"), (3867, "Magurele IF"), (6307, "Moara Vlasiei IF"), (3947, "Mogosoaia IF"), (12307, "Nuci IF"), (3487, "Otopeni IF"), (3447, "Pantelimon IF"), (8087, "Peris IF"), (10787, "Petrachioaia IF"), (3647, "Popesti Leordeni IF"), (7727, "Snagov IF"), (3287, "Stefanestii de Jos IF"), (3987, "Tunari IF"), (5947, "Vidra IF"), (1682, "Voluntari IF")],
    "MARAMURES" : [(11728, "Ariniș MM"), (822, "Baia Mare MM"), (782, "Baia Sprie MM"), (9510, "Bogdan Voda MM"), (4107, "Borsa MM"), (8527, "Cernesti MM"), (7450, "Farcasa MM"), (8947, "Gardani MM"), (13289, "Grosi MM"), (4347, "Miresu Mare MM"), (13067, "Moisei MM"), (12407, "Oncesti MM"), (13267, "Recea MM"), (11909, "Remetea Chioarului MM"), (15048, "Remeti MM"), (10167, "Ruscova MM"), (8409, "Sacalaseni MM"), (6794, "Satulung MM"), (402, "Seini MM"), (762, "Sighetu Marmaţiei MM"), (3067, "Somcuta Mare MM"), (1042, "Targu Lapus MM"), (1122, "Tautii Magheraus MM"), (12147, "Valea Chioarului MM"), (2447, "Viseu de Sus MM")],
    "MEHEDINTI" : [(15127, "Baia de Arama MH"), (10647, "Cazanesti MH"), (202, "Drobeta Turnu Severin MH"), (11927, "Eselnita MH"), (3208, "Orsova MH"), (7808, "SIMIAN MH"), (14427, "Strehaia MH"), (13447, "Vanju Mare MH")],
    "MURES" : [(6788, "Acatari MS"), (15867, "Adamus MS"), (9689, "Albesti MS"), (12127, "Atintis  MS"), (11329, "Batos MS"), (13627, "Brancovenesti MS"), (14947, "Breaza MS"), (11447, "Ceuasu de Campie MS"), (7947, "Corunca MS"), (11008, "Danes MS"), (14007, "Eremitu MS"), (9907, "Fantanele MS"), (8187, "Galesti MS"), (6807, "Ganesti MS"), (6749, "Glodeni MS"), (9887, "Gornesti MS"), (10367, "Gurghiu MS"), (11027, "Hodac MS"), (6967, "Ibanesti MS"), (3767, "Iernut MS"), (5788, "Livezeni MS"), (15527, "Magherani MS"), (5667, "Miercurea Nirajului MS"), (6789, "Nades MS"), (6787, "Panet MS"), (7887, "Raciu MS"), (1422, "Reghin MS"), (12788, "Rusii Munti MS"), (7007, "Sancraiu de Mures MS"), (5227, "Sangeorgiu de Mures MS"), (10328, "Sarmasu MS"), (662, "Sighişoara MS"), (7569, "Suseni MS"), (2427, "Sîntana de Mureş MS"), (22, "Targu Mureş MS"), (922, "Tarnaveni MS"), (10927, "Vargata MS")],
    "NEAMT" : [(9407, "Alexandru cel Bun NT"), (7247, "Bicaz NT"), (9587, "Botesti NT"), (7527, "Cordun NT"), (7667, "Dumbrava Rosie NT"), (9268, "Gheraesti NT"), (9448, "Ghindaoani NT"), (14749, "Hangu NT"), (10509, "Icusesti NT"), (9509, "Pancesti NT"), (12769, "Pastraveni NT"), (3007, "Piatra Neamţ NT"), (13249, "Podoleni NT"), (8407, "Raucesti NT"), (1002, "Roman NT"), (2242, "Roznov NT"), (8367, "Sabaoani NT"), (9167, "Savinesti NT"), (12487, "Stefan cel Mare NT"), (8747, "Tamaseni NT"), (10127, "Tarcau NT"), (523, "Targu Neamt NT"), (10028, "Timisesti NT"), (8091, "Valeni NT"), (5907, "Vânătorii-Neamț NT"), (7987, "Zanesti NT")],
    "OLT" : [(4507, "Bals OT"), (1202, "Bobiceşti OT"), (1582, "Caracal OT"), (1622, "Corabia OT"), (13527, "Ianca OT"), (15067, "Piatra-Olt OT"), (9188, "Rusanesti OT"), (482, "Slatina OT"), (11467, "Vadastrita OT"), (10429, "Vitomiresti OT")],
    "PRAHOVA" : [(10307, "Adunati PH"), (14387, "Albesti Paleologu PH"), (6587, "Aricestii Rahtivani PH"), (14627, "Azuga PH"), (3247, "Baicoi PH"), (9387, "Baltesti PH"), (7087, "Barcanesti PH"), (7767, "Berceni PH"), (11748, "Blejoi PH"), (842, "Boldești-Scăeni PH"), (8288, "Brazi PH"), (2042, "Breaza PH"), (3868, "Brebu PH"), (5647, "Bucov PH"), (1942, "Busteni PH"), (5527, "Bănești PH"), (7809, "Ceptura PH"), (11907, "Cocorastii Mislii PH"), (4927, "Comarnic PH"), (5748, "Cornu PH"), (1442, "Câmpina PH"), (6327, "Drajna PH"), (9027, "Fantanele PH"), (11070, "Filipestii de Targ PH"), (8507, "Gura Vadului PH"), (14447, "Magureni PH"), (6507, "Maneciu PH"), (6008, "Mizil PH"), (222, "Ploieşti PH"), (9067, "Poiana Campina PH"), (10567, "Poienarii Burchii PH"), (14407, "Posesti PH"), (13988, "Provita de Jos PH"), (5507, "Păulesti PH"), (4567, "Rifov PH"), (13107, "Scorteni PH"), (2747, "Sinaia PH"), (4647, "Sirna PH"), (9607, "Slanic PH"), (6608, "Targsoru Vechi PH"), (9707, "Teisani PH"), (11087, "Telega PH"), (11330, "Tinosu PH"), (622, "Urlati PH"), (8287, "Valea Calugareasca PH"), (9327, "Valea Doftanei PH"), (562, "Vălenii de Munte PH")],
    "SALAJ" : [(8329, "Almasu SJ"), (13487, "Cehu Silvaniei SJ"), (9527, "Crasna SJ"), (13371, "Cuzaplac SJ"), (14347, "Fildu de Jos SJ"), (10267, "Galgau SJ"), (16067, "Mirsid SJ"), (4287, "Oras Jibou SJ"), (12549, "Rus SJ"), (2342, "Simleu Silvaniei SJ"), (82, "Zalău SJ")],
    "SATU MARE" : [(14049, "Andrid SM"), (2510, "Ardud SM"), (9667, "Botiz SM"), (3708, "Carei SM"), (16407, "Doba SM"), (11588, "Dorolt SM"), (7627, "Lazuri SM"), (10907, "Mediesu Aurit SM"), (15427, "Moftin SM"), (6247, "Negresti-Oas SM"), (6447, "Paulesti SM"), (15547, "Piscolt SM"), (9408, "Sacaseni SM"), (1242, "Satu Mare SM"), (16467, "Supur SM"), (6793, "Tarna Mare SM"), (10827, "Tiream SM"), (1702, "Tăşnad SM"), (6107, "Vetis SM")],
    "SIBIU" : [(9867, "Agnita SB"), (2387, "Alma SB"), (2587, "Alţîna SB"), (2393, "Arpașu de Jos SB"), (11768, "Atel SB"), (2389, "Avrig SB"), (8467, "Axente Sever SB"), (2507, "Biertan SB"), (2391, "Blăjel SB"), (2528, "Bruiu SB"), (2390, "Brădeni SB"), (2408, "Bîrghiș SB"), (2388, "Carța SB"), (2527, "Chirpăr SB"), (2407, "Cirtisoara SB"), (5327, "Cisnădie SB"), (4327, "Copsa Mica SB"), (12550, "Cristian SB"), (5927, "Dumbrăveni SB"), (4847, "Dîrlos SB"), (5908, "Hoghilag SB"), (2062, "Mediaș SB"), (3907, "Miercurea Sibiului SB"), (15807, "Ocna Sibiului SB"), (11787, "Orlat SB"), (9508, "Poplaca SB"), (13108, "Porumbacu de Jos SB"), (8728, "Racovita SB"), (1562, "Saliste SB"), (11128, "Selimbar SB"), (162, "Sibiu SB"), (8227, "Slimnic SB"), (2607, "Talmaciu SB"), (4547, "Tirnava SB"), (15967, "Turnu Rosu SB")],
    "SUCEAVA" : [(12767, "Adancata SV"), (2680, "Arbore SV"), (15147, "Baia SV"), (7789, "Balaceana SV"), (14467, "Bogdanesti SV"), (7708, "Boroaia SV"), (13147, "Bunesti SV"), (2324, "Campulung Moldovenesc SV"), (10928, "Cornu Luncii SV"), (9410, "Dorna-Arini SV"), (6547, "Dumbraveni SV"), (16187, "Fantana Mare SV"), (10711, "Frasin SV"), (8748, "Fratautii Vechi SV"), (2910, "Fundu Moldovei SV"), (1022, "Fălticeni SV"), (9708, "Granicesti SV"), (942, "Gura Humorului SV"), (15607, "Hantesti, SV"), (11312, "Hartop SV"), (13007, "Horodniceni SV"), (8309, "Milisauti SV"), (14527, "Mitocu Dragomirnei SV"), (11968, "Moara SV"), (10510, "Musenita SV"), (9007, "Patrauti SV"), (5207, "Poiana Stampei SV"), (7029, "Pojorata SV"), (2162, "Radauti SV"), (8128, "Sadova SV"), (7287, "Scheia SV"), (5887, "Siret SV"), (12948, "Straja SV"), (303, "Suceava SV"), (3348, "Vatra Dornei SV")],
    "TELEORMAN" : [(2043, "Alexandria TR"), (6009, "Calinesti  TR"), (10789, "Draganesti-Vlasca TR"), (6927, "Fantanele TR"), (13388, "Galăteni  TR"), (9187, "Mavrodin  TR"), (14567, "Plosca TR"), (11327, "Poeni TR"), (14747, "Radoiesti TR"), (4247, "Rosiorii de Vede TR"), (5107, "Turnu Magurele TR"), (862, "Videle TR"), (5687, "Zimnicea TR")],
    "TIMIS" : [(14087, "Becicherecu Mic TM"), (10207, "Biled TM"), (9767, "Carpinis TM"), (10107, "Cenad TM"), (12687, "Cenei TM"), (8787, "Cheveresu Mare TM"), (8089, "Ciacova TM"), (13187, "Comlosu Mare TM"), (11267, "Criciova TM"), (9207, "Darova TM"), (1062, "Deta TM"), (5867, "Dudestii Vechi TM"), (1742, "Dudeştii Noi TM"), (4887, "Dumbrăviţa TM"), (13188, "Faget TM"), (9227, "Gataia TM"), (5087, "Ghiroda TM"), (6748, "Giarmata TM"), (5487, "Giroc TM"), (5827, "Jamu Mare TM"), (1102, "Jimbolia TM"), (9427, "Lenauheim TM"), (982, "Lugoj TM"), (4807, "Mosnita Noua TM"), (11407, "Padureni TM"), (6950, "Peciu Nou TM"), (7213, "Periam TM"), (6127, "Sanandrei TM"), (8587, "Sandra TM"), (6750, "Satchinez TM"), (12589, "Stiuca TM"), (802, "Sânnicolau Mare TM"), (4307, "Săcălaz TM"), (362, "Timişoara TM"), (10948, "Uivar TM")],
    "TULCEA" : [(2142, "Babadag TL"), (13088, "Baia TL"), (13567, "Bestepe TL"), (7407, "C.A. Rosetti TL"), (10467, "Carcaliu TL"), (10347, "Casimcea TL"), (15707, "Ceatalchioi TL"), (7127, "Cerna TL"), (8667, "Chilia Veche TL"), (16287, "Ciucurova TL"), (9807, "Crisan TL"), (10047, "Dorobantu TL"), (1362, "Frecăţei TL"), (7748, "Greci TL"), (8807, "Grindu TL"), (10287, "Hamcearca TL"), (6769, "Horia TL"), (6791, "I.C.Bratianu TL"), (6770, "Isaccea TL"), (12949, "Izvoarele TL"), (7747, "Jijila TL"), (16687, "JURILOVCA TL"), (102, "Luncaviţa TL"), (7547, "Macin TL"), (12551, "Mahmudia  TL"), (13008, "Maliuc TL"), (12568, "Mihai Bravu TL"), (12467, "Mihail Kogalniceanu TL"), (11328, "Murighiol TL"), (14507, "Nalbant TL"), (6790, "Niculitel TL"), (6772, "Nufaru TL"), (6667, "Ostrov TL"), (7367, "Sfantu Gheorghe TL"), (2509, "Slava Cercheza TL"), (9087, "Smardan TL"), (6887, "Somova TL"), (2627, "Stejaru TL"), (6609, "Sulina TL"), (2547, "Topolog TL"), (422, "Tulcea TL"), (12947, "Turcoaia TL"), (6047, "Vacareni TL"), (5767, "Valea Nucarilor TL")],
    "VALCEA" : [(5387, "Alunu VL"), (2947, "Baile Govora VL"), (10747, "Baile Olanesti VL"), (13387, "Balcești  VL"), (10487, "Barbatesti VL"), (6067, "Brezoi VL"), (10728, "Bujoreni VL"), (6267, "Calimanesti VL"), (13547, "Cernisoara VL"), (10568, "Costesti VL"), (14907, "Creteni VL"), (2467, "Drăgășani VL"), (15047, "Fartatesti VL"), (15627, "Francesti VL"), (3227, "Galicea VL"), (3228, "Glavile VL"), (15987, "Golesti VL"), (4907, "Grădiştea VL"), (5187, "Horezu VL"), (11791, "Maciuca VL"), (12547, "Malaia VL"), (3467, "Maldaresti VL"), (2967, "Milcoiu VL"), (15787, "Muereasca VL"), (2847, "Nicolae Balcescu VL"), (11788, "Ocnele Mari VL"), (3127, "Otesani VL"), (13607, "Pausesti VL"), (3047, "Pietrari VL"), (2887, "Păușești-Măglași VL"), (12967, "Racovita VL"), (3670, "Rosiile VL"), (702, "Râmnicu Vâlcea VL"), (10027, "Salatrucel VL"), (3387, "Sinesti VL"), (5147, "Stoilești VL"), (14547, "Susani VL"), (13167, "Tetoiu VL"), (4967, "Tomşani VL"), (3327, "Vaideeni VL"), (3187, "Voineasa VL"), (3667, "Zatreni VL")],
    "VASLUI" : [(14048, "Albesti VS"), (3107, "Barlad VS"), (15227, "Berezeni VS"), (10089, "Bogdanesti  VS"), (10288, "Codaesti VS"), (13369, "Deleni VS"), (16427, "Dimitrie Cantemir VS"), (12987, "Dranceni VS"), (16027, "Hoceni VS"), (1082, "Husi VS"), (12667, "Ivanesti VS"), (14487, "Laza VS"), (2708, "Lipovat VS"), (11187, "Muntenii de Jos VS"), (5128, "Negrești VS"), (13370, "Oltenești  VS"), (16607, "Osesti VS"), (11771, "Poienesti VS"), (16587, "Rafaila VS"), (13207, "Rebricea VS"), (15347, "Rosiesti VS"), (14967, "Stanilesti VS"), (15907, "Todiresti VS"), (2344, "Vaslui VS"), (6948, "Vetrișoaia VS"), (4747, "Vinderei VS"), (11707, "Zorleni VS")],
    "VRANCEA"  : [(2345, "Adjud VN"), (10727, "Barsesti VN"), (7827, "Biliesti VN"), (9367, "Bolotesti VN"), (8267, "Campuri VN"), (13368, "Ciorăști VN"), (12267, "Cirligele VN"), (4787, "Coteşti VN"), (11427, "Dumbraveni VN"), (11967, "Fitionesti VN"), (1282, "Focşani VN"), (2728, "Garoafa VN"), (13907, "Golesti VN"), (2987, "Gologanu VN"), (13367, "Gugești VN"), (15007, "Jaristea VN"), (2990, "Marasesti VN"), (9412, "Milcovul VN"), (16247, "Movilita VN"), (14227, "Nanesti VN"), (3087, "Obrejita VN"), (6771, "Odobesti VN"), (7907, "Panciu VN"), (3747, "Poiana Cristei VN"), (7749, "Popesti VN"), (14748, "Pufesti VN"), (12187, "Rastoaca VN"), (2262, "Sihlea VN"), (3068, "Slobozia Ciorasti VN"), (10229, "Soveja VN"), (8007, "Străoane VN"), (12248, "Suraia VN"), (14548, "Tamboesti VN"), (11311, "Tanasoaia VN"), (11667, "Urechesti VN"), (13587, "Vanatori VN"), (14349, "Virtescoiu VN"), (10807, "Vizantea-Livezi VN")]
]
