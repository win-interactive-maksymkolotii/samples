package
{
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
    import flash.utils.Dictionary;

    public class PhysicsData extends Object
	{
		// ptm ratio
        public var ptm_ratio:Number = 32;
		
		// the physcis data 
		var dict:Dictionary;
		
        //
        // bodytype:
        //  b2_staticBody
        //  b2_kinematicBody
        //  b2_dynamicBody

        public function createBody(name:String, world:b2World, bodyType:uint, userData:*):b2Body
        {
            var fixtures:Array = dict[name];

            var body:b2Body;
            var f:Number;

            // prepare body def
            var bodyDef:b2BodyDef = new b2BodyDef();
            bodyDef.type = bodyType;
            bodyDef.userData = userData;

            // create the body
            body = world.CreateBody(bodyDef);

            // prepare fixtures
            for(f=0; f<fixtures.length; f++)
            {
                var fixture:Array = fixtures[f];

                var fixtureDef:b2FixtureDef = new b2FixtureDef();

                fixtureDef.density=fixture[0];
                fixtureDef.friction=fixture[1];
                fixtureDef.restitution=fixture[2];

                fixtureDef.filter.categoryBits = fixture[3];
                fixtureDef.filter.maskBits = fixture[4];
                fixtureDef.filter.groupIndex = fixture[5];
                fixtureDef.isSensor = fixture[6];

                if(fixture[7] == "POLYGON")
                {                    
                    var p:Number;
                    var polygons:Array = fixture[8];
                    for(p=0; p<polygons.length; p++)
                    {
                        var polygonShape:b2PolygonShape = new b2PolygonShape();
                        polygonShape.SetAsArray(polygons[p], polygons[p].length);
                        fixtureDef.shape=polygonShape;

                        body.CreateFixture(fixtureDef);
                    }
                }
                else if(fixture[7] == "CIRCLE")
                {
                    var circleShape:b2CircleShape = new b2CircleShape(fixture[9]);                    
                    circleShape.SetLocalPosition(fixture[8]);
                    fixtureDef.shape=circleShape;
                    body.CreateFixture(fixtureDef);                    
                }                
            }

            return body;
        }

		
        public function PhysicsData(): void
		{
			dict = new Dictionary();
			

			dict["vesta"] = [

									];

			dict["asteroid"] = [

										[
											// density, friction, restitution
                                            2, 0, 0,
                                            // categoryBits, maskBits, groupIndex, isSensor
											1, 65535, 0, false,
											'POLYGON',

                                            // vertexes of decomposed polygons
                                            [

                                                [   new b2Vec2(126/ptm_ratio, 23/ptm_ratio)  ,  new b2Vec2(151/ptm_ratio, 28/ptm_ratio)  ,  new b2Vec2(167/ptm_ratio, 42/ptm_ratio)  ,  new b2Vec2(184/ptm_ratio, 63/ptm_ratio)  ,  new b2Vec2(211/ptm_ratio, 102/ptm_ratio)  ,  new b2Vec2(83/ptm_ratio, 54/ptm_ratio)  ,  new b2Vec2(84/ptm_ratio, 44/ptm_ratio)  ,  new b2Vec2(101/ptm_ratio, 25/ptm_ratio)  ] ,
                                                [   new b2Vec2(40/ptm_ratio, 124/ptm_ratio)  ,  new b2Vec2(62/ptm_ratio, 201/ptm_ratio)  ,  new b2Vec2(39/ptm_ratio, 179/ptm_ratio)  ,  new b2Vec2(30/ptm_ratio, 162/ptm_ratio)  ,  new b2Vec2(29/ptm_ratio, 142/ptm_ratio)  ] ,
                                                [   new b2Vec2(211/ptm_ratio, 102/ptm_ratio)  ,  new b2Vec2(184/ptm_ratio, 63/ptm_ratio)  ,  new b2Vec2(207/ptm_ratio, 82/ptm_ratio)  ] ,
                                                [   new b2Vec2(79/ptm_ratio, 203/ptm_ratio)  ,  new b2Vec2(75/ptm_ratio, 65/ptm_ratio)  ,  new b2Vec2(83/ptm_ratio, 54/ptm_ratio)  ,  new b2Vec2(211/ptm_ratio, 102/ptm_ratio)  ,  new b2Vec2(215/ptm_ratio, 110/ptm_ratio)  ,  new b2Vec2(93/ptm_ratio, 211/ptm_ratio)  ,  new b2Vec2(86/ptm_ratio, 210/ptm_ratio)  ] ,
                                                [   new b2Vec2(50/ptm_ratio, 77/ptm_ratio)  ,  new b2Vec2(75/ptm_ratio, 65/ptm_ratio)  ,  new b2Vec2(79/ptm_ratio, 203/ptm_ratio)  ,  new b2Vec2(62/ptm_ratio, 201/ptm_ratio)  ,  new b2Vec2(40/ptm_ratio, 124/ptm_ratio)  ,  new b2Vec2(39/ptm_ratio, 103/ptm_ratio)  ,  new b2Vec2(42/ptm_ratio, 87/ptm_ratio)  ] ,
                                                [   new b2Vec2(198/ptm_ratio, 199/ptm_ratio)  ,  new b2Vec2(162/ptm_ratio, 205/ptm_ratio)  ,  new b2Vec2(209/ptm_ratio, 159/ptm_ratio)  ,  new b2Vec2(209/ptm_ratio, 182/ptm_ratio)  ,  new b2Vec2(204/ptm_ratio, 195/ptm_ratio)  ] ,
                                                [   new b2Vec2(223/ptm_ratio, 138/ptm_ratio)  ,  new b2Vec2(220/ptm_ratio, 147/ptm_ratio)  ,  new b2Vec2(209/ptm_ratio, 159/ptm_ratio)  ,  new b2Vec2(162/ptm_ratio, 205/ptm_ratio)  ,  new b2Vec2(101/ptm_ratio, 217/ptm_ratio)  ,  new b2Vec2(93/ptm_ratio, 211/ptm_ratio)  ,  new b2Vec2(215/ptm_ratio, 110/ptm_ratio)  ,  new b2Vec2(221/ptm_ratio, 115/ptm_ratio)  ] ,
                                                [   new b2Vec2(101/ptm_ratio, 217/ptm_ratio)  ,  new b2Vec2(162/ptm_ratio, 205/ptm_ratio)  ,  new b2Vec2(142/ptm_ratio, 224/ptm_ratio)  ,  new b2Vec2(134/ptm_ratio, 227/ptm_ratio)  ,  new b2Vec2(113/ptm_ratio, 230/ptm_ratio)  ,  new b2Vec2(108/ptm_ratio, 228/ptm_ratio)  ]
											]

										]

									];

		}
	}
}
