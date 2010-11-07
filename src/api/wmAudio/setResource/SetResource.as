package api.wmAudio.setResource
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Bindable]
	public class SetResource extends WmAudio
	{
		// Required
		public var resource:String = null;
		
		public function SetResource(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setResource( videoResource:String = null ):void
		{
			resource = compareStrings( videoResource , resource );
			
			switch( resource )
			{
				case null:
					missingResource();
					break;
				default:
					ssCore.WmAudio.setResource( {resource:resource}
											   ,{callback:actionComplete, errorSTR:"setResourceError", code:"46008"} );
			}
		}
	}
}