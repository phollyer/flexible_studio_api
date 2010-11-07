package api.guides.create
{
	import flash.events.IEventDispatcher;
	import api.guides.Guides;
	import api.vos.guides.CreateVO;
	
	[Event(name="missingGuideName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingOffset" , type="api.events.SWFStudioEvent")]
	[Event(name="missingOrientation" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Create extends Guides
	{
		// Required
		public var createSettings:CreateVO = new CreateVO();
		
		public function Create(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function create( name:String = null , orientation:String = null , offset:Object = null ):void
		{
			createSettings.name = compareStrings( name , createSettings.name );
			createSettings.orientation = compareStrings( orientation , createSettings.orientation );
			createSettings.offset = compareObjects( offset , createSettings.offset );
			
			switch( createSettings.name )
			{
				case null:
					missingName();
					break;
				default:
					switch( createSettings.orientation )
					{
						case null:
							missingOrientation();
							break;
						case CreateVO.HORIZONTAL:
						case CreateVO.VERTICAL:
							switch( createSettings.offset )
							{
								case null:
									missingOffset();
									break;
								default:
									createGuide();
							}
							break;
						default:
							invalidOrientation();
					}
			}
		}
		private function createGuide():void
		{
			ssCore.Guides.create( createSettings
								,{callback:actionComplete, errorSTR:"createError", code:"21000"} );
		}
		private function invalidOrientation():void
		{
			var e : CreateEvent = new CreateEvent( CreateEvent.RESULT_ORIENTATION );
			dispatchEvent( e );
		}


	}
}