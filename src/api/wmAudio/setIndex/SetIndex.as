package api.wmAudio.setIndex
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Event(name="missingIndex" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetIndex extends WmAudio
	{
		// Optional 
		public var index:Number = -1;
		
		public function SetIndex(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setIndex( timeIndex:Number = -1 ):void
		{
			index = compareNumbers( timeIndex , index );
			
			switch( index > -1 )
			{
				case false:
					missingIndex();
					break;
				default:
					ssCore.WmAudio.setIndex( {index:index}
											,{callback:actionComplete, errorSTR:"setIndexError", code:"46004"} );
			}
		}
	}
}