import { client } from "~/utils/db.server.ts"
import { createPassword, createUser } from "./seed-utils.ts"
import { insertUser } from "~/modules/users/infraestructure/queries/insertUser.query.ts"
import { getPasswordHash } from "~/utils/auth.server.ts"
import { insertProduct } from "~/modules/catalogue/infraestructure/queries/insertProduct.query.ts"
import { insertCompany } from "~/modules/companies/infraestructure/queries/insertCompany.query.ts"

async function seed() {
	console.log('🌱 Seeding...')
	console.time(`🌱 Database has been seeded`)
	const clientWithoutACLs = client.withConfig({
		apply_access_policies: false
	})

	console.time('🧹 Cleaned up the database...')
	// No cambiar orden, tienen que borrarse en este orden por el tema de los links
	await clientWithoutACLs.execute('Delete Verification;')
	await clientWithoutACLs.execute('Delete Session;')
	await clientWithoutACLs.execute('Delete Brand;')
	await clientWithoutACLs.execute('Delete Image;')
	// await clientWithoutACLs.execute('Delete SaleOrderLine;')
	// await clientWithoutACLs.execute('Delete SaleOrder;')
	await clientWithoutACLs.execute('Delete Product;')
	await clientWithoutACLs.execute('Delete User;')
	await clientWithoutACLs.execute('Delete Password;')
	await clientWithoutACLs.execute('Delete Company;')
	// await clientWithoutACLs.execute('reset schema to initial')
	console.timeEnd('🧹 Cleaned up the database...')

	console.time(`👑 Created admin role/permission...`)
	console.timeEnd(`👑 Created admin role/permission...`)
	// hosts with ships and reviews
	// renters with bookings and reviews
	// hosts who are renters also
	console.time(
		`🐨 Created company "david moran" `,
	)
	const dm_company = await insertCompany(clientWithoutACLs, {
		fiscal_name: 'David Moran SA',
		comercial_name: 'David Moran',
		vat: 'A298781927',
	})

	const vuladi_company = await insertCompany(clientWithoutACLs, {
		fiscal_name: 'Vulcanizados anton',
		comercial_name: 'Vuladi',
		vat: 'B2987819653',
	})

	const fluchos_company = await insertCompany(clientWithoutACLs, {
		fiscal_name: 'Zapatos Fluchos SL',
		comercial_name: 'Fluchos',
		vat: 'B299283461',
	})
	console.timeEnd(`👑 Companias creadas...`)


	const totalUsers = 40
	console.time(`👤 Created ${totalUsers} users...`)
	for (let i = 0; i < totalUsers; i++) {
		const { email, name, username } = createUser();
		const { hash: userHashedPassword } = createPassword();

		await insertUser(clientWithoutACLs, {
			email: email,
			name: name,
			username: username,
			hashed_password: userHashedPassword,
		})
	}
	console.timeEnd(`👤 Created ${totalUsers} users...`)

	console.time(
		`🐨 Created user "kody" with the password "kodylovesyou" and admin role`,
	)

	const user = await insertUser(clientWithoutACLs, {
		email: 'kody@kcd.dev',
		username: 'kody',
		name: 'Kody',
		hashed_password: await getPasswordHash('kodylovesyou'),
		role: "SUPERADMIN"
	})
	// TODO update the rolo to SUPERADMIN

	// No encuentra el fichero
	// await insertUserAvatar(clientWithoutACLs, {
	// 	user_id: user.id,
	// 	content_type: 'image/png',
	// 	blob: await fs.promises.readFile('../public/img/user.png'),
	// })

	console.timeEnd(
		`🐨 Created user "kody" with the password "kodylovesyou" and admin role`,
	)

	await insertProduct(clientWithoutACLs, {
		name: 'Zapatilla nike airmax 234 talla 42 color negro',
		reference: "2345-42-black",
		price: 53.34,
		barcode: "2345296123490",
		family: "Zapatilla Nike Airmax 234",
		family_code: "2345",
		season: "oto-inv",
		color: "negro",
		size: "42",
		owner_id: dm_company.id
	})

	await insertProduct(clientWithoutACLs, {
		name: 'Zapatilla nike airmax 234 talla 43 color negro',
		reference: "2345-43-black",
		barcode: "2345296123411",
		family: "Zapatilla Nike Airmax 234",
		family_code: "2345",
		season: "oto-inv",
		color: "negro",
		size: "43",
		price: 53.34,
		owner_id: dm_company.id
	})

	await insertProduct(clientWithoutACLs, {
		name: 'Zapatilla nike airmax 234 talla 44 color negro',
		reference: "2345-44-black",
		barcode: "2345296123482",
		family: "Zapatilla Nike Airmax 234",
		family_code: "2345",
		season: "oto-inv",
		color: "negro",
		size: "44",
		price: 53.34,
		owner_id: dm_company.id
	})

	await insertProduct(clientWithoutACLs, {
		name: 'Zapato Pitillos 9876 talla 40 color marron',
		reference: "2345-40-marron",
		barcode: "8345296122445",
		family: "Zapato Pitillos 9876",
		family_code: "9876",
		season: "pri-ver",
		color: "marron",
		size: "40",
		price: 53.34,
		owner_id: dm_company.id
	})

	await insertProduct(clientWithoutACLs, {
		name: 'Zapato Pitillos 9876 talla 41 color marron',
		reference: "2345-41-marron",
		barcode: "8345296122438",
		family: "Zapato Pitillos 9876",
		family_code: "9876",
		season: "pri-ver",
		color: "marron",
		size: "41",
		price: 53.34,
		owner_id: vuladi_company.id
	})

	await insertProduct(clientWithoutACLs, {
		name: 'Zapato Pitillos 9876 talla 42 color marron',
		reference: "2345-42-marron",
		barcode: "8345296198265592",
		family: "Zapato Pitillos 9876",
		family_code: "9876",
		season: "pri-ver",
		color: "marron",
		size: "42",
		price: 23.34,
		owner_id: vuladi_company.id
	})

	const product_1 = await insertProduct(clientWithoutACLs, {
		name: 'Zapato Fluchos Archi talla 37 color verde',
		reference: "2345-37-verde",
		barcode: "83452961223412",
		family: "Zapato Fluchos Archi",
		family_code: "457689",
		season: "pri-ver",
		color: "verde",
		size: "37",
		price: 43.34,
		owner_id: vuladi_company.id
	})

	const product_2 = await insertProduct(clientWithoutACLs, {
		name: 'Zapato Fluchos Archi talla 37 color Rojo',
		reference: "2345-37-rojo",
		barcode: "834529923643269",
		family: "Zapato Fluchos Archi",
		family_code: "457689",
		season: "pri-ver",
		color: "rojo",
		size: "37",
		price: 53.34,
		owner_id: fluchos_company.id
	})

	console.timeEnd(
		`🐨 Created products for company davidmoran`,
	)

	// console.time(
	// 	`🐨 Creating order `,
	// )

	// const purchase_order = await insertPurchaseOrder(clientWithoutACLs, {
	// 	name: 'COOP-PO12345-test',
	// 	reference: 'lhasflhaskdfh',
	// 	season: 'pri-ver',
	// 	active: true,
	// 	open: true
	// })

	// const sale_order = await insertSaleOrder(clientWithoutACLs, {
	// 	reference: 'PO12345-test',
	// 	owner_id: dm_company.id,
	// 	created_by_id: user.id,
	// 	purchase_order_id: purchase_order.id,
	// })

	// const order_lines = [
	// 	{
	// 		product: { connect: { id: product_1.id } },
	// 		qty: 12,
	// 		price: 23.45,
	// 		discount: 0.0,
	// 		note: "linea de prueba",
	// 		purchaseOrder: { connect: { id: purchase_order.id } },
	// 	},
	// 	{
	// 		product: { connect: { id: product_2.id } },
	// 		qty: 12,
	// 		price: 23.45,
	// 		discount: 0.0,
	// 		note: "Eyy esto lo quiero urgente por favor",
	// 		purchaseOrder: { connect: { id: purchase_order.id } },
	// 	},
	// ]

	// const linePromises = order_lines.map(async (line) => {
	// 	await insertSaleOrderLine(clientWithoutACLs, {
	// 		price: line.price,
	// 		product_id: line.product.connect.id,
	// 		qty: line.qty,
	// 		sale_order_id: sale_order.id,
	// 		discount: line.discount,
	// 		note: line.note
	// 	})
	// });

	// console.timeEnd(
	// 	`🐨 Pedido creado`,
	// )


	console.timeEnd(`🌱 Database has been seeded`)
}

seed();
