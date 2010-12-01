package api.guides.create
{
	import api.events.guides.create.CreateEvent;

	import api.guides.Guides;

	import api.vos.guides.CreateVO;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>name</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_NAME
	*/
	[Event(name="missingGuideName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingOffset" , type="api.events.SWFStudioEvent")]
	[Event(name="missingOrientation" , type="api.events.SWFStudioEvent")]
	[Event(name="missingName", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Guides_create.html Northcode Help Documentation
	*/
	public class Create extends Guides
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var createSettings:CreateVO = new CreateVO();
		
		/**
		* Constructor for Guides.Create()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Guides_create.html Northcode Help Documentation
		*/
		public function Create(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param name
		*
		* @param orientation
		*
		* @param offset
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Guides_create.html Northcode Help Documentation
		*/
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
			var e : CreateEvent = new CreateEvent( CreateEvent.INVALID_ORIENTATION );
			dispatchEvent( e );
		}


	}
}