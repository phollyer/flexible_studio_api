package api.mask.enable
{
	import flash.events.IEventDispatcher;
	import api.mask.Mask;
	
	[Event(name="missingMaskName" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Enable extends Mask
	{
		// Required
		public var name:String = null;
		
		public function Enable(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function enable( maskName:String = null ):void
		{
			name = compareStrings( maskName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Mask.enable( {}
										,{callback:actionComplete, errorSTR:"enableError", code:"27001"} );
			}
		}
	}
}